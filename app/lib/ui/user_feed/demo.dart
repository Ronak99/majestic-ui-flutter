import 'package:flutter/material.dart';
import 'package:user_feed_page/user_feed_page.dart';

class UserFeedDemo extends StatelessWidget {
  const UserFeedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: UserFeedPage(),
    );
  }
}
