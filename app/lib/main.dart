import 'package:app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_feed/provider/user_feed_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserFeedProvider())],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffffffff),
          brightness: Brightness.light,
          // scaffoldBackgroundColor: const Color(0xff0a0a0a),
          // brightness: Brightness.dark,
        ),
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
