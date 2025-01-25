import 'package:flutter/material.dart';

import 'majestic/ui/star_rush_background.dart';

class StarRushBackgroundDemo extends StatelessWidget {
  const StarRushBackgroundDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StarRushBackground(
        speed: 5,
      ),
    );
  }
}
