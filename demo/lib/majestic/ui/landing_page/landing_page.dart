import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:provider/provider.dart';

import './provider/landing_page_state_provider.dart';
import './config/landing_page_config.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LandingPageStateProvider(),
      builder: (context, _) {
        final landingPageProvider =
            Provider.of<LandingPageStateProvider>(context);

        return Scaffold(
          body: landingPageList[landingPageProvider.selectedIndex],
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: landingPageProvider.selectedIndex,
            onTap: landingPageProvider.onTabChange,
            items: [
              /// Home
              SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title: const Text("Home"),
                selectedColor: Colors.purple,
              ),

              /// Likes
              SalomonBottomBarItem(
                icon: const Icon(Icons.favorite_border),
                title: const Text("Likes"),
                selectedColor: Colors.pink,
              ),

              /// Search
              SalomonBottomBarItem(
                icon: const Icon(Icons.search),
                title: const Text("Search"),
                selectedColor: Colors.orange,
              ),

              /// Profile
              SalomonBottomBarItem(
                icon: const Icon(Icons.person),
                title: const Text("Profile"),
                selectedColor: Colors.teal,
              ),
            ],
          ),
        );
      },
    );
  }
}
