import 'package:envied/envied.dart';

part 'env_dev.g.dart';

@Envied(path: '.env.dev', useConstantCase: true)
abstract class DevEnv {
    @EnviedField(varName: 'DEV_SECRET_ANDROID')
    static const String devSecretAndroid = _DevEnv.devSecretAndroid;
    @EnviedField(varName: 'DEV_API_HOST')
    static const String devApiHost = _DevEnv.devApiHost;
}