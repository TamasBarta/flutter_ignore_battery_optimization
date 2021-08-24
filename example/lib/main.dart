import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:ignore_battery_optimization/ignore_battery_optimization.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    bool platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await IgnoreBatteryOptimization.isIgnoringBatteryOptimizations(
              "com.mhz.ignorebattery.ignore_battery_optimization_example");
    } on PlatformException {
      platformVersion = false;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      isOpen = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment : MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  IgnoreBatteryOptimization.openIgnoringBatteryOptimizations(
                      "com.mhz.ignorebattery.ignore_battery_optimization_example");
                },
                child: Text('开启电池优化'),
              ),
              ElevatedButton(
                child: Text('是否开启$isOpen'),
                onPressed: () {
                  initPlatformState();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
