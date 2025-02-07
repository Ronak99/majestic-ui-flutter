import 'package:app/router/router.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      backgroundColor: Colors.black,
      defaultDevice: DeviceInfo.genericPhone(
        platform: TargetPlatform.iOS,
        id: 'iphone12',
        name: 'iPhone 12 Mini',
        screenSize: const Size(375, 812),
      ),
      isToolbarVisible: false,
      data: const DevicePreviewData(
        orientation: Orientation.portrait,
      ),
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffffffff),
        brightness: Brightness.light,
      ),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
