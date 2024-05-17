import 'package:envied/envied.dart';

part 'env_prod.g.dart';

@Envied(path: '.env.prod', obfuscate: true)
abstract class ProdEnv {
  @EnviedField(varName: 'secretAndroid')
  static final String secretAndroid = _ProdEnv.secretAndroid;
  @EnviedField(varName: 'prodApiHost')
  static final String prodApiHost = _ProdEnv.prodApiHost;
  @EnviedField( varName: 'prodAppSuffix')
  static final String prodAppSuffix = _ProdEnv.prodAppSuffix;
  @EnviedField( varName: 'prodImgSuffix')
  static final String prodImgSuffix = _ProdEnv.prodImgSuffix;
}
