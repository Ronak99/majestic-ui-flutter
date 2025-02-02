import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 35,
            width: 35,
            child: Image.network(
                'https://raw.githubusercontent.com/Ronak99/majestic-ui-flutter/refs/heads/master/assets/logo-small.png'),
          ),
          const SizedBox(width: 8),
          const Text(
            'Majestic UI',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 28,
            ),
          ),
        ],
      ),
    );
  }
}
