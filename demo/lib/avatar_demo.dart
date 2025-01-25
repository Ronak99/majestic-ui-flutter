import 'package:flutter/material.dart';

class MajesticAvatarDemo extends StatelessWidget {
  const MajesticAvatarDemo({super.key});

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
              height: 50,
              width: 50,
              radius: 2,
              text: "Ronak",
            ),
            Text("ronak"),
          ],
        ),
      ),
    );
  }
}
