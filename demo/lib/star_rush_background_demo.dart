import 'package:flutter/material.dart';

import 'majestic/ui/star_rush_background.dart';

class StarRushBackgroundDemo extends StatelessWidget {
  const StarRushBackgroundDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          StarRushBackground(
            speed: 750,
            maxRadius: 2,
            minRadius: 1,
            colors: [
              Colors.blue[100]!,
              Colors.blue[300]!,
              Colors.red[200]!,
              Colors.white,
            ],
          ),
        ],
      ),
    );
  }
}
