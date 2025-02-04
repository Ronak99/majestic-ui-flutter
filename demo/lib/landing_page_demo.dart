import 'package:flutter/material.dart';

import 'package:demo/majestic/ui/landing_page/landing_page.dart';

class LandingPageDemo extends StatelessWidget {
  const LandingPageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const LandingPage();
  }
}

// Or Navigate to this page
class ParentPage extends StatelessWidget {
  const ParentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LandingPage(),
          ),
        ),
        child: const Text('Navigate'),
      ),
    );
  }
}
