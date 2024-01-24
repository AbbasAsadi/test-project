import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gandom/gen/assets.gen.dart';
import 'package:gandom/src/core/routing/my_pages.dart';
import 'package:gandom/src/core/ui_utils.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../Sample/test_project/lib/src/core/secure_storage/my_secure_storage.dart';

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
        bool hasToken = await MySecureStorage.getInstance().hasToken();
        if (hasToken) {
          context.go(MyPages.main);
        } else {
          context.go(MyPages.welcome);
        }
      },
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset(
            Assets.images.gandomGalleryOtp.path,
            width: UIUtils.getConvertedWidth(context, 90),
            height: UIUtils.getConvertedHeight(context, 192),
          ),
        ),
      ),
    );
  }
}
