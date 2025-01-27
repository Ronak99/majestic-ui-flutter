import 'package:empty_state/empty_state.dart';
import 'package:flutter/material.dart';

class EmptyStateDemo extends StatelessWidget {
  const EmptyStateDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: EmptyState(),
    );
  }
}
