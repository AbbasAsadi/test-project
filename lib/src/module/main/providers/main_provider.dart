import 'package:flutter/material.dart';
import 'package:test_project/src/core/provider/safe_provider.dart';

class MainProvider extends SafeProvider {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  int currentIndex = 0;
  bool showCategoryLayer = false;

  void changeCurrentIndex(int index) {
    if (showCategoryLayer) {
      showCategoryLayer = false;
      notifyListeners();
    } else if (currentIndex != index) {
      currentIndex = index;
      showCategoryLayer = false;
      notifyListeners();
    }
  }
}
