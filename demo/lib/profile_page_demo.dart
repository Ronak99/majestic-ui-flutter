import 'majestic/ui/profile_page/profile_page.dart';
import 'package:flutter/material.dart';

class ProfilePageDemo extends StatelessWidget {
  const ProfilePageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfilePage();
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
            builder: (context) => const ProfilePage(),
          ),
        ),
        child: const Text('Navigate'),
      ),
    );
  }
}
