import 'package:dart01/core/configs/theme/app_theme.dart';
import 'package:dart01/presentation/splash/pages/splash.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) => MyApp(),
    enabled: true,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
