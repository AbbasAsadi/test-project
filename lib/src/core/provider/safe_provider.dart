import 'package:flutter/material.dart';

class SafeProvider extends ChangeNotifier {
  bool canNotify = true;

  @override
  void notifyListeners() {
    if (canNotify) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    canNotify = false;
    super.dispose();
  }
}
