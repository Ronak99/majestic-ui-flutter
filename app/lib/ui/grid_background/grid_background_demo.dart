import 'package:animated_grid_background/animated_grid_background.dart';
import 'package:flutter/material.dart';

class GridBackgroundDemo extends StatelessWidget {
  const GridBackgroundDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedGridBackground(),
    );
  }
}
