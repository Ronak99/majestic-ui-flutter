import 'package:basic_provider_architecture/state/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);

    return Text(
      counterProvider.count.toString(),
    );
  }
}
