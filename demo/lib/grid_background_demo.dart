import 'package:demo/majestic/ui/grid_background/grid_background.dart';
import 'package:flutter/material.dart';

class AnimatedGridBackgroundDemo extends StatelessWidget {
  const AnimatedGridBackgroundDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      // By default renders a white coloured grid, therefore looks best on a black background.
      body: GridBackground(),
    );
  }
}
