// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env_prod.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _ProdEnv {
  static const List<int> _enviedkeysecretAndroid = <int>[
    2570079570,
    2929541389,
    3306597235,
    847114234,
    2927010861,
    3254364334,
    657943744,
    129320393,
    2480867108,
    412424849,
    3180427845,
    3349629580,
    1011586953,
    198990051,
    750891754,
    3896611257,
    1577801367,
    2573311064,
    3002307474,
  ];

  static const List<int> _envieddatasecretAndroid = <int>[
    2570079521,
    2929541480,
    3306597136,
    847114120,
    2927010888,
    3254364378,
    657943711,
    129320360,
    2480867146,
    412424949,
    3180427831,
    3349629667,
    1011587040,
    198989959,
    750891701,
    3896611273,
    1577801445,
    2573311031,
    3002307574,
  ];

  static final String secretAndroid = String.fromCharCodes(List<int>.generate(
    _envieddatasecretAndroid.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddatasecretAndroid[i] ^ _enviedkeysecretAndroid[i]));

  static const List<int> _enviedkeyprodApiHost = <int>[
    2749881584,
    4280865202,
    2366258139,
    3044678725,
    1228752928,
    3517736858,
    1625202658,
    2224448347,
  ];

  static const List<int> _envieddataprodApiHost = <int>[
    2749881472,
    4280865216,
    2366258100,
    3044678689,
    1228753023,
    3517736955,
    1625202578,
    2224448306,
  ];

  static final String prodApiHost = String.fromCharCodes(List<int>.generate(
    _envieddataprodApiHost.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddataprodApiHost[i] ^ _enviedkeyprodApiHost[i]));

  static const List<int> _enviedkeyprodAppSuffix = <int>[
    694898968,
    2815402111,
    3475071705,
    2790967367,
    2146573395,
  ];

  static const List<int> _envieddataprodAppSuffix = <int>[
    694898998,
    2815401999,
    3475071659,
    2790967336,
    2146573367,
  ];

  static final String prodAppSuffix = String.fromCharCodes(List<int>.generate(
    _envieddataprodAppSuffix.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddataprodAppSuffix[i] ^ _enviedkeyprodAppSuffix[i]));

  static const List<int> _enviedkeyprodImgSuffix = <int>[
    3584425668,
    1751331108,
    204110207,
    122123857,
    2545456879,
  ];

  static const List<int> _envieddataprodImgSuffix = <int>[
    3584425627,
    1751331156,
    204110093,
    122123838,
    2545456779,
  ];

  static final String prodImgSuffix = String.fromCharCodes(List<int>.generate(
    _envieddataprodImgSuffix.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddataprodImgSuffix[i] ^ _enviedkeyprodImgSuffix[i]));
}
