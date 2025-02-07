import 'package:flutter/material.dart';

import 'majestic/ui/categories_page/categories_page.dart';

class CategoriesPageDemo extends StatelessWidget {
  const CategoriesPageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const CategoriesPage();
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
            builder: (context) => const CategoriesPage(),
          ),
        ),
        child: const Text('Navigate'),
      ),
    );
  }
}
