import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:test_project/gen/assets.gen.dart';
import 'package:test_project/src/core/constants/my_dimensions.dart';
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
      const Duration(seconds: 3),
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            Assets.images.splashBg.path,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fitHeight,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black.withOpacity(.7),
          ),
          Positioned(
            bottom: MyDimensions.xxLarge,
            child: Column(
              children: [
                Text(
                  'Good coffee,\nGood friends,\nlet it blends',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: const Color(0xFFCBCBD4),
                      ),
                ),
                Gap(MyDimensions.light),
                Lottie.asset('assets/loading.json', height: 150),
              ],
            ),
          )
        ],
      ),
    );
  }
}
