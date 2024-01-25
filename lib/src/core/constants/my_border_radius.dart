import 'package:flutter/material.dart';
import 'package:test_project/src/core/constants/my_dimensions.dart';

class MyBorderRadius {
  MyBorderRadius._();

  static const BorderRadius topRounded56 = BorderRadius.vertical(
    top: Radius.circular(56),
  );

  static BorderRadius all5 = BorderRadius.circular(5);
  static BorderRadius all8 = BorderRadius.circular(8);
  static BorderRadius all12 = BorderRadius.circular(12);
  static BorderRadius all16 = BorderRadius.circular(16);
  static BorderRadius allXXLarge = BorderRadius.circular(MyDimensions.xxLarge);
}
