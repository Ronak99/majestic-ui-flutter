import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;

  const ActionButton({
    super.key,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        padding: const EdgeInsets.all(15),
        // child: RotatedBox(
        //   quarterTurns: 2,
        //   // You can easily swap it out with SvgPicture.asset to quickly load SVG assets from assets folder.
        //   child: SvgPicture.network(
        //     'images/long_tail_back_arrow.svg',
        //     color: Colors.white,
        //   ),
        // ),
      ),
    );
  }
}
