import 'package:flutter/material.dart';
import 'package:test_project/src/core/routing/my_routes.dart';
import 'package:test_project/src/core/theme/my_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routerConfig: MyRoutes.router,
      theme: MyTheme.lightTheme(),
    );
  }
}
