import '../colors.dart';
import 'package:flutter/material.dart';

class OAuthButton extends StatelessWidget {
  final Widget child;
  const OAuthButton({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: mutedForegroundColor,
          width: .5,
        ),
      ),
      alignment: Alignment.center,
      height: 60,
      width: 60,
      padding: const EdgeInsets.all(12),
      child: child,
    );
  }
}
