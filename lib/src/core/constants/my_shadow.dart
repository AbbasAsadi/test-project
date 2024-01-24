import 'package:flutter/material.dart';
import 'package:test_project/src/core/constants/my_colors.dart';

class MyShadow {
  MyShadow._();

  static BoxShadow shadow1 = BoxShadow(
    color: Colors.white.withOpacity(.13),
    spreadRadius: 2,
  );

  static const BoxShadow shadow2 = BoxShadow(
    color: MyColors.primary,
    spreadRadius: -25.0,
    blurRadius: 26,
  );
}
