import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: Image.network(
                'https://raw.githubusercontent.com/Ronak99/majestic-ui-flutter/refs/heads/master/assets/logo-small.png'),
          ),
          const Text('Majestic UI'),
        ],
      ),
    );
  }
}
