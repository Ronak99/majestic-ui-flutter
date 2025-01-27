import 'package:categories/data/data.dart';
import 'package:categories/state/categories_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesLeftPanel extends StatelessWidget {
  const CategoriesLeftPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriesStateProvider =
        Provider.of<CategoriesStateProvider>(context);

    const double itemSize = 36 * 2;

    return Container(
      width: 78,
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
      child: Row(
        children: [
          Expanded(
            child: ListView(
              children: categoriesStateProvider.allCategories
                  .map(
                    (categoryItem) => GestureDetector(
                      onTap: () =>
                          categoriesStateProvider.updateCategory(categoryItem),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color:
                                    categoriesStateProvider.selectedCategory ==
                                            categoryItem
                                        ? const Color(0xffceffda)
                                        : const Color(0xfff3f5f7),
                                shape: BoxShape.circle,
                              ),
                              height: itemSize,
                              width: itemSize,
                              margin: const EdgeInsets.only(bottom: 4),
                            ),
                            Text(
                              categoryItem.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight:
                                    categoriesStateProvider.selectedCategory ==
                                            categoryItem
                                        ? FontWeight.w700
                                        : FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
