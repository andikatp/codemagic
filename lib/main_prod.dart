import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list/env/env_prod.dart';
import 'package:list/flavor_config.dart';
import 'package:list/flutter_mode_config.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

final _shorebirdCodePush = ShorebirdCodePush();

void main() {
  FlavorConfig(
    flavor: FlavorType.prod,
    values: FlavorValues(
      titleApp: "Prod App",
      secretAndroid: ProdEnv.prodSecretAndroid,
      apiHost: ProdEnv.prodApiHost,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _isShorebirdAvailable = _shorebirdCodePush.isShorebirdAvailable();
  int? _currentPatchVersion;
  bool _isCheckingForUpdate = false;

  @override
  void initState() {
    _shorebirdCodePush.currentPatchNumber().then((_) {
      if (!mounted) return;
      setState(() {
        _currentPatchVersion = _currentPatchVersion;
      });
    });
    super.initState();
  }

  Future<void> _checkForUpdate() async {
    setState(() {
      _isCheckingForUpdate = true;
    });

    final isUpdateAvailable =
        await _shorebirdCodePush.isNewPatchAvailableForDownload();

    if (!mounted) return;

    setState(() {
      _isCheckingForUpdate = false;
    });

    if (isUpdateAvailable) {
      _showUpdateAvailableBanner();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No update available'),
        ),
      );
    }
  }

  void _showDownloadingBanner() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      const MaterialBanner(
        content: Text('Downloading...'),
        actions: [
          SizedBox(
            height: 14,
            width: 14,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        ],
      ),
    );
  }

  void _showUpdateAvailableBanner() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: const Text('Update available'),
        actions: [
          TextButton(
            onPressed: () async {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              await _downloadUpdate();

              if (!mounted) return;
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: const Text('Download'),
          ),
        ],
      ),
    );
  }

  void _showRestartBanner() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      const MaterialBanner(
        content: Text('A new patch is ready!'),
        actions: [
          TextButton(
            onPressed: Restart.restartApp,
            child: Text('Restart app'),
          ),
        ],
      ),
    );
  }

  Future<void> _downloadUpdate() async {
    _showDownloadingBanner();

    await Future.wait([
      _shorebirdCodePush.downloadUpdateIfAvailable(),
      // Add an artificial delay so the banner has enough time to animate in.
      Future<void>.delayed(const Duration(milliseconds: 250)),
    ]);

    if (!mounted) return;

    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    _showRestartBanner();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text(FlavorConfig.instance.values.titleApp),
      ),
      body: Column(
        children: [
          Text('Flavor: ${FlavorConfig.instance.flavor.name}'),
          Text('secretAndroid: ${FlavorConfig.instance.values.secretAndroid}'),
          Text('api: ${FlavorConfig.instance.values.apiHost}'),
          Text('Mode: ${FlutterModeConfig.flutterMode}'),
          if (!_isShorebirdAvailable)
            const Text('Shorebird Engine not available.'),
          if (_isShorebirdAvailable)
            ElevatedButton(
              onPressed: _isCheckingForUpdate ? null : _checkForUpdate,
              child: _isCheckingForUpdate
                  ? const CupertinoActivityIndicator()
                  : const Text('Check for update'),
            ),
        ],
      ),
    );
  }
}
