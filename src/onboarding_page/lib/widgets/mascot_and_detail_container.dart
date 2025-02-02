import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/onboarding_item.dart';

class MascotAndDetailContainer extends StatelessWidget {
  final OnboardingItem welcomeScreenEntity;

  const MascotAndDetailContainer({
    super.key,
    required this.welcomeScreenEntity,
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
              welcomeScreenEntity.assetImage,
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
                  welcomeScreenEntity.title,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  welcomeScreenEntity.subtitle,
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
