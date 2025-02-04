import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './state/categories_state_provider.dart';
import './ui/sections/main/categories_main_view.dart';
import './utils/dimensions.dart';
import './ui/sections/left/categories_left_panel.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

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
