import 'package:flutter/material.dart';

import 'majestic/ui/user_feed/user_feed.dart';

class UserFeedDemo extends StatelessWidget {
  const UserFeedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UserFeed(),
    );
  }
}
