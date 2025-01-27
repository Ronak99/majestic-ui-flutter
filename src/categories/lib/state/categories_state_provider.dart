import 'package:categories/data/data.dart';
import 'package:categories/models/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesStateProvider extends ChangeNotifier {
  List<CategoryItem> _allCategories = [];
  List<CategoryItem> get allCategories => _allCategories;

  late CategoryItem _selectedCategory;
  CategoryItem get selectedCategory => _selectedCategory;

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
}
