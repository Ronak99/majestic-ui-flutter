import 'package:flutter/material.dart';
import 'package:mesh_gradient/mesh_gradient.dart';

class AnimationOptions {
  final double frequency;
  final double amplitude;
  final double speed;
  final double grain;

  const AnimationOptions({
    this.frequency = 5,
    this.amplitude = 30,
    this.speed = 2,
    this.grain = 0,
  })  : assert(grain >= 0 && grain <= 1),
        assert(speed >= 0.01 && speed <= 15);

  factory AnimationOptions.subtle() {
    return const AnimationOptions(
      frequency: 3,
      amplitude: 15,
      speed: 1,
      grain: 0.2,
    );
  }

  // Dramatic animation preset
  factory AnimationOptions.dramatic() {
    return const AnimationOptions(
      frequency: 8,
      amplitude: 45,
      speed: 4,
      grain: 0.5,
    );
  }
}

class AnimatedButton extends StatelessWidget {
  final dynamic child;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final BorderRadiusGeometry borderRadius;
  final List<Color>? colors;
  final AnimationOptions options;

  const AnimatedButton({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
    this.borderRadius = const BorderRadius.all(Radius.circular(100)),
    this.colors,
    this.options = const AnimationOptions(),
    required this.onPressed,
  }) : assert(child is Widget || child is String);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: GestureDetector(
        onTap: onPressed,
        child: ClipRRect(
          borderRadius: borderRadius,
          child: AnimatedMeshGradient(
            colors: colors != null && colors!.isNotEmpty
                ? colors!
                : const [
                    Colors.pink,
                    Colors.blueAccent,
                    Color.fromARGB(255, 199, 6, 6),
                    Colors.purple
                  ],
            options: AnimatedMeshGradientOptions(
              speed: options.speed,
              amplitude: options.amplitude,
              frequency: options.frequency,
              grain: options.grain,
            ),
            child: Container(
              padding: padding,
              alignment: Alignment.center,
              child: child is String
                  ? Text(
                      child,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    )
                  : child,
            ),
          ),
        ),
      ),
    );
  }
}
