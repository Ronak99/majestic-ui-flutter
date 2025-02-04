import 'majestic/ui/onboarding_page/onboarding_page.dart';
import 'package:flutter/material.dart';

class OnboardingPageDemo extends StatelessWidget {
  const OnboardingPageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingPage(
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
            builder: (context) => OnboardingPage(
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
