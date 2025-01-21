import 'dart:math';
import 'package:flutter/material.dart';

class Utils {
  static Color generateRandomColor() {
    return Color.fromARGB(
      255,
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
    );
  }
}
