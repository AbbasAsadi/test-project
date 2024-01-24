import 'package:flutter/material.dart';

abstract class MyColors {
  static const Color primary = Color(0xFF153A32);
  static const Color primaryLight = Color(0xFF337668);
  static const Color primaryDark = Color(0xFF0C2621);

  static const Color textColor = Color(0xFF112922);
  static const Color textColorGold = Color(0xFFC59355);

  static const Color grey_10 = Color(0xFFFDFDFD);
  static const Color grey_12 = Color(0xFFFBFDE0);
  static const Color grey_15 = Color(0xFFD7D7D7);
  static const Color grey_20 = Color(0xFFE2E2E2);
  static const Color grey_30 = Color(0xA5FDFDFD);
  static const Color grey_40 = Color(0xFFA9A9A9);
  static const Color grey_50 = Color(0xFF707070);
  static const Color grey_60 = Color(0xFF5C5C5C);
  static const Color grey_80 = Color(0xFF3A3A3A);
  static const Color grey_90 = Color(0xFF282828);

  static const Color hintColor = Color(0xFF454545);

  static List<Color> singleAppGradient = [
    const Color(0xff16292D),
    const Color(0xffC3FFF7).withAlpha(0),
  ];

  static List<Color> searchBar = [
    primaryLight,
    const Color(0x009BC7BE),
  ];
}
