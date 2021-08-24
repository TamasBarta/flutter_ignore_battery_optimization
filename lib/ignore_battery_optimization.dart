import 'dart:async';

import 'package:flutter/services.dart';

class IgnoreBatteryOptimization {
  static const MethodChannel _channel =
      const MethodChannel('ignore_battery_optimization');

  //android版本必须>=23
  static Future<bool> isIgnoringBatteryOptimizations(String packageName) async {
    final bool? isIgnoringBatteryOptimizations = await _channel
        .invokeMethod<bool>(
            'isIgnoringBatteryOptimizations', {'packageName': packageName});
    return isIgnoringBatteryOptimizations!;
  }
  //android版本必须>=23
  static Future<bool> openIgnoringBatteryOptimizations(String packageName) async {
    final bool? isIgnoringBatteryOptimizations = await _channel
        .invokeMethod<bool>(
            'openIgnoringBatteryOptimizations', {'packageName': packageName});
    return isIgnoringBatteryOptimizations!;
  }
}
