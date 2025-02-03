import 'package:flutter/material.dart';
import 'package:profile_page/models/option_item.dart';

const double basePadding = 16;
const double userDetailFraction = .45;
const double offset = 0.04;
const double contentFraction = userDetailFraction - offset;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            // Background
            Container(
              height: height * userDetailFraction,
              decoration: const BoxDecoration(
                color: Colors.black,
                // Replace this with an asset image for loading the background quickly.
                image: DecorationImage(
                  image: NetworkImage(
                      "https://raw.githubusercontent.com/Ronak99/majestic-ui-flutter/refs/heads/master/assets/background-pattern.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: basePadding),
                  child: Column(
                    children: [
                      // Top AppBar
                      const Row(
                        children: [
                          Text(
                            "Profile",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),

                      const Spacer(),

                      // User Image
                      const CircleAvatar(
                        backgroundImage:
                            NetworkImage("https://www.picsum.photos/100"),
                        radius: 75,
                      ),

                      const SizedBox(height: 12),

                      const Text(
                        "Ronak Punase",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),

                      const SizedBox(height: 4),

                      const Text(
                        "Flutter Developer",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),

                      // Remaining height
                      SizedBox(
                        height: height * offset,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Foreground
            Column(
              children: [
                // Base Profile Section
                SizedBox(
                  height: height * contentFraction,
                ),

                // Account Overview
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Account Overview',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 24),
                        ...profileOptions.map(
                          (option) => GestureDetector(
                            onTap: () => {},
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 24),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: option.color.withOpacity(.2),
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    height: 50,
                                    width: 50,
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(right: 12),
                                    child: Icon(
                                      option.icon,
                                      color: option.color,
                                    ),
                                  ),
                                  Text(
                                    option.label,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 16,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
