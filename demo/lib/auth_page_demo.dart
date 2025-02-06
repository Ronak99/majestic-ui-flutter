import 'majestic/ui/auth_page/auth_page.dart';
import 'package:flutter/material.dart';

class AuthPageDemo extends StatelessWidget {
  const AuthPageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthPage();
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
            builder: (context) => const AuthPage(),
          ),
        ),
        child: const Text('Navigate'),
      ),
    );
  }
}
