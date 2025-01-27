import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final TextStyle titleTextStyle;
  final TextStyle subtitleTextStyle;
  const EmptyState({
    super.key,
    this.titleTextStyle = const TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w600,
    ),
    this.subtitleTextStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.white38,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 8),
            Text(
              'No Orders',
              style: titleTextStyle,
            ),
            const SizedBox(height: 4),
            Text(
              "You have't made any orders yet.",
              style: subtitleTextStyle,
            ),
            const SizedBox(height: 36),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                overlayColor: WidgetStateProperty.resolveWith(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.pressed)) {
                      return Colors.deepPurple;
                    }
                    return null;
                  },
                ),
                backgroundColor: WidgetStateProperty.resolveWith(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.hovered)) {
                      return Colors.blue;
                    }
                    if (states.contains(WidgetState.focused)) {
                      return Colors.red;
                    }
                    if (states.contains(WidgetState.pressed)) {
                      return Colors.pink;
                    }
                    return Colors.white;
                  },
                ),
                foregroundColor: WidgetStateProperty.resolveWith(
                  (Set<WidgetState> states) {
                    return Colors.black;
                  },
                ),
                textStyle: WidgetStateProperty.all(
                  const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                padding: WidgetStateProperty.resolveWith(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.pressed)) {
                      return const EdgeInsets.all(20);
                    }
                    return const EdgeInsets.all(10);
                  },
                ),
              ),
              child: const Text("Make an order"),
            ),
            // FittedBox(
            //   child: GestureDetector(
            //     onTap: () {},
            //     child: Container(
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(8),
            //       ),
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 48, vertical: 12),
            //       alignment: Alignment.center,
            //       child: const Text(
            //         'Make an order now',
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontWeight: FontWeight.w600,
            //           fontSize: 22,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
