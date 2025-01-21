import 'package:app/avatar/majestic_avatar_demo.dart';
import 'package:app/card/card_demo.dart';
import 'package:app/home/home.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: "/avatar",
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
  ],
);
