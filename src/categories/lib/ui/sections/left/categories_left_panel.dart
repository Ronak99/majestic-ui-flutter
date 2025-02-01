import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../state/categories_state_provider.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/colors.dart';

class CategoriesLeftPanel extends StatelessWidget {
  const CategoriesLeftPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriesStateProvider =
        Provider.of<CategoriesStateProvider>(context);

    final safeArePaddingTop = MediaQuery.of(context).padding.top;

    const double imageSize = 50;
    const double itemHeight = 104;
    const double handleWidth = 5;

    return Container(
      width: leftPanelWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            offset: const Offset(1, 0),
            blurRadius: 2,
          )
        ],
      ),
      child: Stack(
        children: [
          ListView(
            children: categoriesStateProvider.allCategories
                .map(
                  (categoryItem) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => categoriesStateProvider
                              .updateCategory(categoryItem),
                          child: Container(
                            height: itemHeight,
                            color: Colors.transparent,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: categoriesStateProvider
                                                .selectedCategory ==
                                            categoryItem
                                        ? const Color(0xffceffda)
                                        : lightBackgroundColor,
                                    shape: BoxShape.circle,
                                  ),
                                  height: imageSize,
                                  width: imageSize,
                                  margin: const EdgeInsets.only(bottom: 4),
                                ),
                                Text(
                                  categoryItem.name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    height: 1.1,
                                    fontWeight: categoriesStateProvider
                                                .selectedCategory ==
                                            categoryItem
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
          // if (categoriesStateProvider.isAnimating)
          //   AnimatedPositioned(
          //     right: 0,
          //     top: (itemHeight *
          //             categoriesStateProvider.getSelectedCategoryIndex) +
          //         safeArePaddingTop,
          //     duration: const Duration(milliseconds: 300),
          //     curve: Curves.easeInOut,
          //     child: Container(
          //       height: itemHeight,
          //       width: handleWidth,
          //       decoration: BoxDecoration(
          //         color: Colors.green[800],
          //         borderRadius: const BorderRadius.horizontal(
          //           left: Radius.circular(12),
          //         ),
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
