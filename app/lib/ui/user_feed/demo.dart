import 'package:flutter/material.dart';
import 'package:user_feed/user_feed.dart';

class UserFeedDemo extends StatelessWidget {
  const UserFeedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: UserFeed(),
    );
  }
}
