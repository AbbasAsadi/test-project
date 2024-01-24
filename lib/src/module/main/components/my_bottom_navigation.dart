import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/gen/assets.gen.dart';
import 'package:test_project/src/core/constants/my_colors.dart';
import 'package:test_project/src/core/constants/my_dimensions.dart';
import 'package:test_project/src/core/constants/my_paddings.dart';
import 'package:test_project/src/module/main/components/my_bottom_navigation_bar_item.dart';
import 'package:test_project/src/module/main/providers/main_provider.dart';

class MyBottomNavigation extends StatelessWidget {
  const MyBottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MyDimensions.large,
      child: Consumer<MainProvider>(
        builder: (context, provider, child) {
          return Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            margin: MyPaddings.horizontal20,
            padding: MyPaddings.all12,
            color: MyColors.grey_10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyBottomNavigationBarItem(
                  onTap: () => provider.changeCurrentIndex(0),
                  icon: Assets.icons.home,
                  isSelected: provider.currentIndex == 0,
                  title: 'Home',
                ),
                MyBottomNavigationBarItem(
                  onTap: () => provider.changeCurrentIndex(1),
                  icon: Assets.icons.favorite,
                  isSelected: provider.currentIndex == 1,
                  title: 'Favorite',
                ),
                MyBottomNavigationBarItem(
                  onTap: () => provider.changeCurrentIndex(2),
                  icon: Assets.icons.cart,
                  isSelected: provider.currentIndex == 2,
                  title: 'Cart',
                ),
                MyBottomNavigationBarItem(
                  onTap: () => provider.changeCurrentIndex(3),
                  icon: Assets.icons.profile,
                  isSelected: provider.currentIndex == 3,
                  title: 'Profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
