import 'package:flutter/material.dart';
import 'package:test_project/src/core/constants/my_colors.dart';

class MyTheme {
  static ThemeData lightTheme() => ThemeData(
        textTheme: const TextTheme(
          ///Title
          titleLarge: TextStyle(
            fontFamily: 'YekanBakh',
            fontWeight: FontWeight.w700,
            color: MyColors.textColor,
            fontSize: 23,
          ),
          titleMedium: TextStyle(
            fontFamily: 'YekanBakh',
            fontWeight: FontWeight.w700,
            color: MyColors.textColor,
            fontSize: 20,
          ),
          titleSmall: TextStyle(
            fontFamily: 'YekanBakh',
            fontWeight: FontWeight.w700,
            color: MyColors.textColor,
            fontSize: 16,
          ),
          ///Headline
          headlineLarge: TextStyle(
            fontFamily: 'YekanBakh',
            fontWeight: FontWeight.w700,
            color: MyColors.textColor,
            fontSize: 17,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'YekanBakh',
            fontWeight: FontWeight.w500,
            color: MyColors.textColor,
            fontSize: 12,
          ),
          headlineSmall: TextStyle(
            fontFamily: 'YekanBakh',
            fontWeight: FontWeight.w500,
            color: MyColors.textColor,
            fontSize: 10,
          ),
          ///Display
          displayLarge: TextStyle(
            fontFamily: 'Peyda',
            fontWeight: FontWeight.w300,
            color: MyColors.textColor,
            fontSize: 12,
          ),
          displayMedium: TextStyle(
            fontFamily: 'YekanBakh',
            fontWeight: FontWeight.w400,
            color: MyColors.textColor,
            fontSize: 8,
          ),
          displaySmall: TextStyle(
            fontFamily: 'YekanBakh',
            fontWeight: FontWeight.w900,
            color: Colors.white,
            fontSize: 5,
          ),
        ),
      );
}
