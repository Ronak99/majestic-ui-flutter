import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/page_item.dart';

class MascotAndDetailContainer extends StatelessWidget {
  final PageItem pageItem;

  const MascotAndDetailContainer({
    super.key,
    required this.pageItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top + 24,
        ),
        Flexible(
          flex: 6,
          child: Container(
            padding: const EdgeInsets.only(top: 30),
            child: SvgPicture.network(
              pageItem.assetImage,
              height: double.infinity,
            ),
          ),
        ),
        Flexible(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 60, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pageItem.title,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  pageItem.subtitle,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
