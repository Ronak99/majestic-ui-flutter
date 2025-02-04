import 'package:avatar/avatar.dart';
import 'package:flutter/material.dart';

class AvatarDemo extends StatelessWidget {
  const AvatarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Avatar(
              "https://picsum.photos/50",
              isRound: true,
              height: 75,
              width: 75,
              text: "Ronak",
            ),
            SizedBox(height: 4),
            Text(
              "Ronak",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
