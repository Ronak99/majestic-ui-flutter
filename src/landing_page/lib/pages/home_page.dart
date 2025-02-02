import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget {
  final String title;
  final String subtitle;
  const DemoPage({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(title)),
      body: Center(
        child: Text(subtitle),
      ),
    );
  }
}
