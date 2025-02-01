import 'package:flutter/material.dart';

import '../data/data.dart';
import '../models/category_item.dart';

class CategoriesStateProvider extends ChangeNotifier {
  List<CategoryItem> _allCategories = [];
  List<CategoryItem> get allCategories => _allCategories;

  late CategoryItem _selectedCategory;
  CategoryItem get selectedCategory => _selectedCategory;

  bool isAnimating = false;

  CategoriesStateProvider() {
    _initialize();
  }

  void _initialize() async {
    _allCategories = categoryItems;
    _selectedCategory = _allCategories.first;
    notifyListeners();
  }

  void updateCategory(CategoryItem categoryItem) {
    _selectedCategory = categoryItem;
    notifyListeners();
  }

  int get getSelectedCategoryIndex => allCategories.indexOf(selectedCategory);
}
