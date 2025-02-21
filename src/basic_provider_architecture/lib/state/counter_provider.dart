import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void updateCount() {
    _count += 1;
    notifyListeners();
  }
}
