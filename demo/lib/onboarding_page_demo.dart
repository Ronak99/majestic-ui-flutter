import 'majestic/ui/welcome_page/welcome_page.dart';
import 'package:flutter/material.dart';

class WelcomePageDemo extends StatelessWidget {
  const WelcomePageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return WelcomePage(
      onActionButtonTap: () {
        // navigate to app entry page.
      },
    );
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
            builder: (context) => WelcomePage(
              onActionButtonTap: () {
                // navigate to app entry page.
              },
            ),
          ),
        ),
        child: const Text('Navigate'),
      ),
    );
  }
}
