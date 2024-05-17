import 'package:list/env/env_debug.dart';

enum FlavorType {
  dev,
  prof,
  prod,
}

class FlavorValues {
  final String titleApp;
  final String apiHost;
  final String secretAndroid;
  final String appSuffix;
  final String imgSuffix;
  
  const FlavorValues({
    this.titleApp = 'list Dev',
    this.apiHost = DebugEnv.debugApiHost,
    this.appSuffix = DebugEnv.debugAppSuffix,
    this.imgSuffix = DebugEnv.debugImgSuffix,
    this.secretAndroid = DebugEnv.secretAndroid,
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
