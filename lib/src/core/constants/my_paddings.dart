import 'package:flutter/material.dart';
import 'package:test_project/src/core/constants/my_dimensions.dart';

class MyPaddings {
  static var allLight = EdgeInsets.all(MyDimensions.light);
  static var allMedium = EdgeInsets.all(MyDimensions.medium);
  static var allSemiLarge = EdgeInsets.all(MyDimensions.semiLarge);

  static var horizontalMedium =
  EdgeInsets.symmetric(horizontal: MyDimensions.medium);

  static var horizontalLarge =
      EdgeInsets.symmetric(horizontal: MyDimensions.large);


}
