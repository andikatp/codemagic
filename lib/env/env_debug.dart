import 'package:envied/envied.dart';

part 'env_debug.g.dart';

@Envied(path: '.env.debug', useConstantCase: true)
abstract class DebugEnv {
    @EnviedField(varName: 'secretAndroid')
    static const String secretAndroid = _DebugEnv.secretAndroid;
    @EnviedField(varName: 'debugApiHost')
    static const String debugApiHost = _DebugEnv.debugApiHost;
    @EnviedField(varName: 'debugAppSuffix')
    static const String  debugAppSuffix = _DebugEnv.debugAppSuffix;
    @EnviedField(varName: 'debugImgSuffix')
    static const String  debugImgSuffix = _DebugEnv.debugImgSuffix;
}