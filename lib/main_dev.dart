import 'package:flutter/material.dart';
import 'package:list/flavor_config.dart';
import 'package:list/testing/home.dart';
import 'package:upgrader/upgrader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(
    values: const FlavorValues(
      titleApp: "Dev App",
    ),
  );
  await Upgrader.sharedInstance.initialize();
  await Upgrader.clearSavedSettings();
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: Scaffold(
      //   backgroundColor: Colors.white,
      //   appBar: AppBar(
      //     title: Text(FlavorConfig.instance.values.titleApp),
      //   ),
      //   body: Column(
      //             children: [
      //               Text('Flavors: ${FlavorConfig.instance.flavor.name}'),
      //               Text('SecretAndroid: ${FlavorConfig.instance.values.secretAndroid}' ),
      //               Text('api: ${ FlavorConfig.instance.values.apiHost}'),
      //               Text('AppSuffix: ${ FlavorConfig.instance.values.appSuffix}'),
      //               Text('ImgSuffix: ${ FlavorConfig.instance.values.imgSuffix}'),
      //               Text('Mode: ${FlutterModeConfig.flutterMode}'),
      //             ],
      //           ),
      // ),
      home: Home(),
    );
  }
}
