import 'package:flutter/material.dart';
import 'shimmer.dart';

class GridBackground extends StatelessWidget {
  final Color gridColor;
  final Color animationColor;
  final double gridSpacing;
  final double lineWidth;
  final bool shouldAnimate;
  final Widget? child;
  final ShimmerDirection shimmerDirection;
  final Duration duration;
  final int loop;

  const GridBackground({
    super.key,
    this.gridColor = Colors.white30,
    this.animationColor = Colors.white60,
    this.gridSpacing = 15.0,
    this.lineWidth = 0.5,
    this.child,
    this.duration = const Duration(milliseconds: 1500),
    this.shouldAnimate = true,
    this.shimmerDirection = ShimmerDirection.btt,
    this.loop = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        shouldAnimate
            ? Shimmer.fromColors(
                baseColor: gridColor,
                highlightColor: animationColor,
                direction: shimmerDirection,
                enabled: true,
                loop: loop,
                period: duration,
                child: CustomPaint(
                  painter: GridPainter(
                    gridColor: animationColor,
                    gridSpacing: gridSpacing,
                    lineWidth: lineWidth,
                  ),
                  child: Container(),
                ),
              )
            : CustomPaint(
                painter: GridPainter(
                  gridColor: gridColor,
                  gridSpacing: gridSpacing,
                  lineWidth: lineWidth,
                ),
                child: Container(),
              ),
        child ?? const SizedBox.shrink(),
      ],
    );
  }
}

class GridPainter extends CustomPainter {
  final Color gridColor;
  final double gridSpacing;
  final double lineWidth;

  GridPainter({
    required this.gridColor,
    required this.gridSpacing,
    required this.lineWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = gridColor
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke;

    // Calculate number of lines needed
    final horizontalLines = (size.height / gridSpacing).ceil() + 1;
    final verticalLines = (size.width / gridSpacing).ceil() + 1;

    // Offset for animation
    const offset = 0;

    // Draw horizontal lines
    for (var i = 0; i < horizontalLines; i++) {
      final y = (i * gridSpacing + offset) % (size.height + gridSpacing) -
          gridSpacing;
      paint.color = gridColor;
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }

    // Draw vertical lines
    for (var i = 0; i < verticalLines; i++) {
      final x =
          (i * gridSpacing + offset) % (size.width + gridSpacing) - gridSpacing;
      paint.color = gridColor;
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(GridPainter oldDelegate) {
    return false;
  }
}
