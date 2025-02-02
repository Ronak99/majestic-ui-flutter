import '../colors.dart';
import 'package:flutter/material.dart';

class SectionSeparator extends StatelessWidget {
  final String text;

  const SectionSeparator({super.key, required this.text});

  _separator() {
    return Expanded(
      child: Container(
        height: .5,
        color: mutedForegroundColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          _separator(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          _separator(),
        ],
      ),
    );
  }
}
