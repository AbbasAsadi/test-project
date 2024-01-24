import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme() => ThemeData(
        textTheme: const TextTheme(
          ///Headline
          headlineLarge: TextStyle(
            fontFamily: 'lato',
            fontWeight: FontWeight.w800,
            fontSize: 16,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'lato',
            fontWeight: FontWeight.w800,
            fontSize: 12,
          ),
          headlineSmall: TextStyle(
            fontFamily: 'lato',
            fontWeight: FontWeight.w900,
            fontSize: 8,
          ),

          ///Title
          titleLarge: TextStyle(
            fontFamily: 'lato',
            fontWeight: FontWeight.w700,
            fontSize: 28,
          ),
          titleMedium: TextStyle(
            fontFamily: 'lato',
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
          titleSmall: TextStyle(
            fontFamily: 'lato',
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),

          ///Display
          displayLarge: TextStyle(
            fontFamily: 'lato',
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
          displayMedium: TextStyle(
            fontFamily: 'lato',
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          displaySmall: TextStyle(
            fontFamily: 'lato',
            fontWeight: FontWeight.w400,
            fontSize: 6,
          ),
        ),
      );
}
