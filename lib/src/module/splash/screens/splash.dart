import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_project/gen/assets.gen.dart';
import 'package:test_project/src/core/routing/my_pages.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SplashScreen();
  }
}

class _SplashScreen extends StatelessWidget {
  const _SplashScreen();

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(milliseconds: 100),
      () async {
        // bool hasToken = await MySecureStorage.getInstance().hasToken();
        // if (hasToken) {
        //   context.go(MyPages.main);
        // } else {
        //   context.go(MyPages.login);
        // }
        context.go(MyPages.main);
      },
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Image.asset(
          Assets.images.splashBg.path,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}
