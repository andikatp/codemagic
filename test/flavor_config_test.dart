import 'package:flutter_test/flutter_test.dart';
import 'package:list/flavor_config.dart';

void main() {
  group('FlavorConfig', () {
    test('reads titleApp from environment for debug', () {
      // Set debug environment variable (replace with actual variable name)

      // Set values in FlavorConfig
      FlavorConfig(
        flavor: FlavorType.dev,
      );

      expect(FlavorConfig.instance.values.titleApp, 'list Dev');
    });

    test('reads titleApp from environment for debug', () {
      // Set debug environment variable (replace with actual variable name)

      // Set values in FlavorConfig
      FlavorConfig(
        flavor: FlavorType.prod,
        values: const FlavorValues(titleApp: 'Prod App')
      );

      expect(FlavorConfig.instance.values.titleApp, 'Prod App');
    });
  });
}
