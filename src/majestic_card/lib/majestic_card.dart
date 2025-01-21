import 'package:flutter/material.dart';

// details about magestic card
class MajesticCard extends StatelessWidget {
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final Widget? child;
  const MajesticCard({
    super.key,
    this.height,
    this.padding = EdgeInsets.zero,
    this.width,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            blurRadius: 1.5,
            blurStyle: BlurStyle.normal,
            color: Colors.black38,
            offset: Offset(0, .5),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: child,
    );
  }
}
