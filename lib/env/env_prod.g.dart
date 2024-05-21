// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env_prod.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _ProdEnv {
  static const List<int> _enviedkeyprodSecretAndroid = <int>[
    1553749755,
    4199389123,
    1621597243,
    2491849216,
    641750326,
    3386510464,
    3062578822,
    3769133493,
    979138334,
    515250054,
    3379627765,
    3735262262,
    2646705630,
    845042476,
    3077036692,
    3112212311,
    1853829634,
    2692032708,
    339461789,
  ];

  static const List<int> _envieddataprodSecretAndroid = <int>[
    1553749640,
    4199389094,
    1621597272,
    2491849330,
    641750355,
    3386510580,
    3062578905,
    3769133524,
    979138416,
    515250146,
    3379627655,
    3735262297,
    2646705591,
    845042504,
    3077036747,
    3112212263,
    1853829744,
    2692032683,
    339461881,
  ];

  static final String prodSecretAndroid = String.fromCharCodes(
      List<int>.generate(
    _envieddataprodSecretAndroid.length,
    (int i) => i,
    growable: false,
  ).map((int i) =>
          _envieddataprodSecretAndroid[i] ^ _enviedkeyprodSecretAndroid[i]));

  static const List<int> _enviedkeyprodApiHost = <int>[
    3391635855,
    4071998551,
    949241410,
    2197226969,
    2009869720,
    2811868719,
    1008946330,
    2663505282,
  ];

  static const List<int> _envieddataprodApiHost = <int>[
    3391635967,
    4071998501,
    949241389,
    2197226941,
    2009869767,
    2811868750,
    1008946410,
    2663505387,
  ];

  static final String prodApiHost = String.fromCharCodes(List<int>.generate(
    _envieddataprodApiHost.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddataprodApiHost[i] ^ _enviedkeyprodApiHost[i]));
}
