import 'package:flutter/material.dart';

class LandingPageStateProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void onTabChange(int i) {
    _selectedIndex = i;
    notifyListeners();
  }
}
