import 'package:list/env/env_dev.dart';

enum FlavorType {
  dev,
  prof,
  prod,
}

class FlavorValues {
  final String titleApp;
  final String apiHost;
  final String secretAndroid;
  
  const FlavorValues({
    this.titleApp = 'list Dev',
    this.apiHost = DevEnv.devApiHost,
    this.secretAndroid = DevEnv.devSecretAndroid,
  });
}

class FlavorConfig {
  final FlavorType flavor;
  final FlavorValues values;
  
  static FlavorConfig? _instance;

  FlavorConfig({
    this.flavor = FlavorType.dev,
    this.values = const FlavorValues(),
  }) {
    _instance = this;
  }

  static FlavorConfig get instance => _instance ?? FlavorConfig();
}
