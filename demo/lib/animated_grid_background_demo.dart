import 'package:flutter/material.dart';

import 'majestic/ui/animated_grid_background/animated_grid_background.dart';

class AnimatedGridBackgroundDemo extends StatelessWidget {
  const AnimatedGridBackgroundDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedGridBackground(),
    );
  }
}
