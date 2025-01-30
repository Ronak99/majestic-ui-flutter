import 'package:flutter/material.dart';
import 'package:star_rush_background/star_rush_background.dart';

class StarRushBackgroundDemo extends StatelessWidget {
  const StarRushBackgroundDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: StarRushBackground(
        speed: 35,
      ),
    );
  }
}
