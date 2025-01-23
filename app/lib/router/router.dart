import 'package:app/ui/animated_button/majestic_animated_button_demo.dart';
import 'package:app/ui/avatar/majestic_avatar_demo.dart';
import 'package:app/ui/card/card_demo.dart';
import 'package:app/ui/home/home.dart';
import 'package:app/ui/star_rush_background/star_rush_background_demo.dart';
import 'package:app/ui/user_feed/user_feed_demo.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: "/user_feed",
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/card_demo',
      builder: (context, state) => const CardDemo(),
    ),
    GoRoute(
      path: '/avatar',
      builder: (context, state) => const MajesticAvatarDemo(),
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
  ],
);
