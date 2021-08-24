import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ignore_battery_optimization/ignore_battery_optimization.dart';

void main() {
  const MethodChannel channel = MethodChannel('ignore_battery_optimization');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
  //
  // test('getPlatformVersion', () async {
  //   expect(await IgnoreBatteryOptimization.platformVersion, '42');
  // });
}
