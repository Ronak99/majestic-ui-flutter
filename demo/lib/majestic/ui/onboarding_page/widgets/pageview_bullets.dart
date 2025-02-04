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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            offset: Offset.zero,
          )
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: List.generate(pageViewItemListLength, (index) => index)
            .map(
              (e) => AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                margin: EdgeInsets.only(
                  right: e == pageViewItemListLength - 1 ? 0 : 8,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: e == selectedPageIndex
                      ? primaryColor
                      : const Color(0xffd9d9d9),
                ),
                height: 8,
                width: 8,
              ),
            )
            .toList(),
      ),
    );
  }
}
