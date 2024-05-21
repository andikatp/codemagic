import 'package:envied/envied.dart';

part 'env_dev.g.dart';

@Envied(path: '.env.dev', useConstantCase: true)
abstract class DevEnv {
    @EnviedField(varName: 'devSecretAndroid')
    static const String devSecretAndroid = _DevEnv.devSecretAndroid;
    @EnviedField(varName: 'devApiHost')
    static const String devApiHost = _DevEnv.devApiHost;
}