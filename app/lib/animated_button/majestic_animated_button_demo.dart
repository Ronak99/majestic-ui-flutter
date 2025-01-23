import 'package:animated_button/majestic_animated_button.dart';
import 'package:flutter/material.dart';

class MajesticAnimatedButtonDemo extends StatelessWidget {
  const MajesticAnimatedButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MajesticAnimatedButton(
          child: const Icon(
            Icons.person,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
