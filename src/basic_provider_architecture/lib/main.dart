import 'package:basic_provider_architecture/registry.dart';
import 'package:basic_provider_architecture/ui/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderRegistry(
      child: HomePage(),
    );
  }
}
