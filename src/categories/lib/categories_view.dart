import 'package:categories/models/category_item.dart';
import 'package:categories/state/categories_state_provider.dart';
import 'package:categories/ui/sections/main/categories_main_view.dart';
import 'package:categories/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './ui/sections/left/categories_left_panel.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: ChangeNotifierProvider(
          create: (_) => CategoriesStateProvider(),
          child: const Stack(
            children: [
              Row(
                children: [
                  SizedBox(width: leftPanelWidth),
                  Expanded(
                    child: CategoriesMainPanel(),
                  ),
                ],
              ),
              CategoriesLeftPanel(),
            ],
          ),
        ),
      ),
    );
  }
}
