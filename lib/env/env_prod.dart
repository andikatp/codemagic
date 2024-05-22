import 'package:envied/envied.dart';

part 'env_prod.g.dart';

@Envied(path: '.env.prod', obfuscate: true)
abstract class ProdEnv {
  @EnviedField(varName: 'PROD_SECRET_ANDROID')
  static final String prodSecretAndroid = _ProdEnv.prodSecretAndroid;
  @EnviedField(varName: 'PROD_API_HOST')
  static final String prodApiHost = _ProdEnv.prodApiHost;
}
