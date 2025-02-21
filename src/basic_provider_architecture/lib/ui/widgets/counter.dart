import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/counter_provider.dart';

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
