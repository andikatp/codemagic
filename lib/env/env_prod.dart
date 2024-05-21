import 'package:envied/envied.dart';

part 'env_prod.g.dart';

@Envied(path: '.env.prod', obfuscate: true)
abstract class ProdEnv {
  @EnviedField(varName: 'prodSecretAndroid')
  static final String prodSecretAndroid = _ProdEnv.prodSecretAndroid;
  @EnviedField(varName: 'prodApiHost')
  static final String prodApiHost = _ProdEnv.prodApiHost;
}
