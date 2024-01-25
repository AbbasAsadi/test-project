import 'package:flutter/material.dart';
import 'package:test_project/gen/assets.gen.dart';
import 'package:test_project/src/core/provider/safe_provider.dart';

class MainProvider extends SafeProvider {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  int currentIndex = 0;
  int currentCategoryIndex = 0;

  List<Map<String, dynamic>> categoryList = [
    {
      "title": "Cappuccino",
      "icon": Assets.icons.cappuccino,
      "items": [
        {
          "id": 0,
          "image": Assets.images.cappuccino1.path,
          "title": "Cappuccino 1",
          "description": "With Chocolate",
          "price": "50\$"
        },
        {
          "id": 1,
          "image": Assets.images.cappuccino2.path,
          "title": "Cappuccino 2",
          "description": "With Low Fat Milk",
          "price": "45\$"
        },
        {
          "id": 2,
          "image": Assets.images.cappuccino3.path,
          "title": "Cappuccino 3",
          "description": "With Chocolate",
          "price": "50\$"
        },
        {
          "id": 3,
          "image": Assets.images.cappuccino1.path,
          "title": "Cappuccino 4",
          "description": "With Low Fat Milk",
          "price": "40\$"
        },
      ]
    },
    {
      "title": "Cold Brew",
      "icon": Assets.icons.coldBrew,
      "items": [
        {
          "id": 0,
          "image": Assets.images.cappuccino1.path,
          "title": "Cold Brew 1",
          "description": "With Chocolate",
          "price": "50\$"
        },
        {
          "id": 1,
          "image": Assets.images.cappuccino2.path,
          "title": "Cold Brew 2",
          "description": "With Low Fat Milk",
          "price": "45\$"
        },
        {
          "id": 2,
          "image": Assets.images.cappuccino3.path,
          "title": "Cold Brew 3",
          "description": "With Chocolate",
          "price": "50\$"
        },
        {
          "id": 3,
          "image": Assets.images.cappuccino1.path,
          "title": "Cold Brew 4",
          "description": "With Low Fat Milk",
          "price": "40\$"
        },
      ]
    },
    {
      "title": "Espresso",
      "icon": Assets.icons.expresso,
      "items": [
        {
          "id": 0,
          "image": Assets.images.cappuccino1.path,
          "title": "Espresso 1",
          "description": "With Chocolate",
          "price": "50\$"
        },
        {
          "id": 1,
          "image": Assets.images.cappuccino2.path,
          "title": "Espresso 2",
          "description": "With Low Fat Milk",
          "price": "45\$"
        },
        {
          "id": 2,
          "image": Assets.images.cappuccino3.path,
          "title": "Espresso 3",
          "description": "With Chocolate",
          "price": "50\$"
        },
        {
          "id": 3,
          "image": Assets.images.cappuccino1.path,
          "title": "Espresso 4",
          "description": "With Low Fat Milk",
          "price": "40\$"
        },
      ]
    },
    {
      "title": "Cappuccino",
      "icon": Assets.icons.cappuccino,
      "items": [
        {
          "id": 0,
          "image": Assets.images.cappuccino1.path,
          "title": "Cappuccino 1",
          "description": "With Chocolate",
          "price": "50\$"
        },
        {
          "id": 1,
          "image": Assets.images.cappuccino2.path,
          "title": "Cappuccino 2",
          "description": "With Low Fat Milk",
          "price": "45\$"
        },
        {
          "id": 2,
          "image": Assets.images.cappuccino3.path,
          "title": "Cappuccino 3",
          "description": "With Chocolate",
          "price": "50\$"
        },
        {
          "id": 3,
          "image": Assets.images.cappuccino1.path,
          "title": "Cappuccino 4",
          "description": "With Low Fat Milk",
          "price": "40\$"
        },
      ]
    },
    {
      "title": "Cold Brew",
      "icon": Assets.icons.coldBrew,
      "items": [
        {
          "id": 0,
          "image": Assets.images.cappuccino1.path,
          "title": "Cold Brew 1",
          "description": "With Chocolate",
          "price": "50\$"
        },
        {
          "id": 1,
          "image": Assets.images.cappuccino2.path,
          "title": "Cold Brew 2",
          "description": "With Low Fat Milk",
          "price": "45\$"
        },
        {
          "id": 2,
          "image": Assets.images.cappuccino3.path,
          "title": "Cold Brew 3",
          "description": "With Chocolate",
          "price": "50\$"
        },
        {
          "id": 3,
          "image": Assets.images.cappuccino1.path,
          "title": "Cold Brew 4",
          "description": "With Low Fat Milk",
          "price": "40\$"
        },
      ]
    },
    {
      "title": "Espresso",
      "icon": Assets.icons.expresso,
      "items": [
        {
          "id": 0,
          "image": Assets.images.cappuccino1.path,
          "title": "Espresso 1",
          "description": "With Chocolate",
          "price": "50\$"
        },
        {
          "id": 1,
          "image": Assets.images.cappuccino2.path,
          "title": "Espresso 2",
          "description": "With Low Fat Milk",
          "price": "45\$"
        },
        {
          "id": 2,
          "image": Assets.images.cappuccino3.path,
          "title": "Espresso 3",
          "description": "With Chocolate",
          "price": "50\$"
        },
        {
          "id": 3,
          "image": Assets.images.cappuccino1.path,
          "title": "Espresso 4",
          "description": "With Low Fat Milk",
          "price": "40\$"
        },
      ]
    },
  ];
  late Map<String, dynamic> selectedCategoryItem =
      categoryList[currentCategoryIndex];

  ScrollController childCategoryListItemController = ScrollController();

  void changeCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void changeCategoryIndex(int index) {
    currentCategoryIndex = index;
    selectedCategoryItem = categoryList[index];
    childCategoryListItemController.animateTo(0,
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
    notifyListeners();
  }
}
