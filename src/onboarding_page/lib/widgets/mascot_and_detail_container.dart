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
        Flexible(
          flex: 6,
          child: Container(
            color: const Color(0xfff7f7f7),
            padding: const EdgeInsets.only(top: 30),
            child: SvgPicture.network(
              welcomeScreenEntity.assetImage,
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
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  welcomeScreenEntity.subtitle,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff757f92),
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
