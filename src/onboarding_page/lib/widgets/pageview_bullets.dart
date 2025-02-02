import 'package:flutter/material.dart';

class PageViewBullets extends StatelessWidget {
  final int pageViewItemListLength;
  final int selectedPageIndex;
  final Color primaryColor;

  const PageViewBullets({
    super.key,
    required this.pageViewItemListLength,
    required this.selectedPageIndex,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(pageViewItemListLength, (index) => index)
          .map(
            (e) => AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: e == selectedPageIndex
                    ? primaryColor
                    : const Color(0xffd9d9d9),
              ),
              height: 6,
              margin: const EdgeInsets.only(right: 8),
              width: 6,
            ),
          )
          .toList(),
    );
  }
}
