import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state/counter_provider.dart';

class ProviderRegistry extends StatelessWidget {
  final Widget child;
  const ProviderRegistry({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterProvider>(
          create: (_) => CounterProvider(),
        ),
      ],
      child: child,
    );
  }
}
