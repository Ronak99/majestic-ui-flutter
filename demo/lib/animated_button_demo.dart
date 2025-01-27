import 'package:flutter/material.dart';

import 'majestic/ui/animated_button.dart';

class AnimatedButtonDemo extends StatelessWidget {
  const AnimatedButtonDemo({super.key});

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
