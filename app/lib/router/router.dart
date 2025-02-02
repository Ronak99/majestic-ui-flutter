import 'package:app/ui/animated_button/demo.dart';
import 'package:app/ui/avatar/demo.dart';
import 'package:app/ui/categories/categories_demo.dart';
import 'package:app/ui/animated_grid_background/animated_grid_background_demo.dart';
import 'package:app/ui/home/demo.dart';
import 'package:app/ui/star_rush_background/demo.dart';
import 'package:app/ui/user_feed/demo.dart';
import 'package:go_router/go_router.dart';
import 'package:landing_page/landing_page.dart';
import 'package:onboarding_page/onboarding_page.dart';

final router = GoRouter(
  initialLocation: "/onboarding_page",
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    // GoRoute(
    //   path: '/card_demo',
    //   builder: (context, state) => const CardDemo(),
    // ),
    GoRoute(
      path: '/avatar',
      builder: (context, state) => const AvatarDemo(),
    ),
    GoRoute(
      path: '/animated_button',
      builder: (context, state) => const MajesticAnimatedButtonDemo(),
    ),
    GoRoute(
      path: '/user_feed',
      builder: (context, state) => const UserFeedDemo(),
    ),
    GoRoute(
      path: '/star_rush_background',
      builder: (context, state) => const StarRushBackgroundDemo(),
    ),
    GoRoute(
      path: '/categories',
      builder: (context, state) => const CategoriesDemo(),
    ),
    GoRoute(
      path: '/animated_grid_background',
      builder: (context, state) => const AnimatedGridBackgroundDemo(),
    ),
    GoRoute(
      path: '/landing_page',
      builder: (context, state) => const LandingPage(),
    ),
    GoRoute(
      path: '/onboarding_page',
      builder: (context, state) => OnboardingPage(
        onActionButtonTap: () async {},
      ),
    ),
  ],
);
