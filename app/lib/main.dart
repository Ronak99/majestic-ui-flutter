import 'package:flutter/material.dart';
import 'package:majestic_card/majestic_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: SizedBox(
            height: 400,
            width: 400,
            child: MajesticCard(
              child: Center(
                child: Text("Code"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
