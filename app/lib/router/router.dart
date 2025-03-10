import 'package:app/ui/animated_button/demo.dart';
import 'package:app/ui/avatar/demo.dart';
import 'package:app/ui/categories_page/categories_page_demo.dart';
import 'package:app/ui/grid_background/grid_background_demo.dart';
import 'package:app/ui/home/demo.dart';
import 'package:app/ui/multi_choice_picker.dart/demo.dart';
import 'package:app/ui/star_rush_background/demo.dart';
import 'package:app/ui/user_feed/demo.dart';
import 'package:auth_page/auth_page.dart';
import 'package:go_router/go_router.dart';
import 'package:landing_page/landing_page.dart';
import 'package:profile_page/profile_page.dart';
import 'package:welcome_page/welcome_page.dart';

final router = GoRouter(
  initialLocation: "/profile_page",
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
      builder: (context, state) => const AnimatedButtonDemo(),
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
      path: '/categories_page',
      builder: (context, state) => const CategoriesPageDemo(),
    ),
    GoRoute(
      path: '/grid_background',
      builder: (context, state) => const GridBackgroundDemo(),
    ),
    GoRoute(
      path: '/landing_page',
      builder: (context, state) => const LandingPage(),
    ),
    GoRoute(
      path: '/welcome_page',
      builder: (context, state) => WelcomePage(
        onActionButtonTap: () async {},
      ),
    ),
    GoRoute(
      path: '/auth_page',
      builder: (context, state) => const AuthPage(),
    ),
    GoRoute(
      path: '/profile_page',
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: '/multi_choice_picker',
      builder: (context, state) => const MultiChoicePickerExample(),
    ),
  ],
);
