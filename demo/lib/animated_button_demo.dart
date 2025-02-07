import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'majestic/ui/animated_button.dart';

class AnimatedButtonDemo extends StatelessWidget {
  const AnimatedButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [
      // Button #1
      FittedBox(
        child: AnimatedButton(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
          borderRadius: BorderRadius.circular(8),
          options: const AnimationOptions(
            frequency: 30,
            amplitude: 20,
            speed: 4,
            grain: 0.0,
          ),
          colors: [
            Colors.amber[700]!,
            Colors.white,
            Colors.white,
            Colors.green
          ],
          child: const Text(
            'India',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          onPressed: () {},
        ),
      ),

      // Button #2
      FittedBox(
        child: AnimatedButton(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
          options: AnimationOptions.subtle(),
          borderRadius: BorderRadius.circular(8),
          colors: const [
            Color(0xff662D8C),
            Color(0xffEE9CA7),
            Color(0xffEE9CA7),
            Color(0xffED1E79),
          ],
          child: const Column(
            children: [
              Icon(
                Icons.timelapse_sharp,
                color: Colors.white,
              ),
              Text(
                'Time to meditate',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          onPressed: () {},
        ),
      ),

      // Background #3
      AnimatedButton(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        options: const AnimationOptions(
          amplitude: 5,
          frequency: 60,
          speed: 8,
        ),
        colors: const [
          Color(0xff042842),
          Color(0xff042842),
          Color(0xff259fd4),
          Color(0xff042842),
        ],
        child: const Row(
          children: [
            Icon(
              CupertinoIcons.sparkles,
              color: Colors.white,
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              'Chat with AI',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ],
        ),
        onPressed: () {},
      ),
    ];

    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgetList
              .map(
                (widget) => Container(
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: Colors.black12,
                        width: .5,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Center(child: widget),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
