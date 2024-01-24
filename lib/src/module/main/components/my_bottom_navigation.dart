import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gandom/gen/assets.gen.dart';
import 'package:gandom/src/core/constants/my_border_radius.dart';
import 'package:gandom/src/core/constants/my_dimensions.dart';
import 'package:gandom/src/core/constants/my_paddings.dart';
import 'package:gandom/src/core/ui_utils.dart';
import 'package:gandom/src/modules/main/components/my_bottom_navigation_bar_item.dart';
import 'package:gandom/src/modules/main/providers/main_provider.dart';
import 'package:provider/provider.dart';

class MyBottomNavigation extends StatelessWidget {
  const MyBottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MyDimensions.medium,
      child: Consumer<MainProvider>(
        builder: (context, provider, child) {
          return Container(
            width:
            UIUtils.getScreenWidth(context) -
                    32,
            alignment: Alignment.center,
            margin: MyPaddings.horizontal20,
            padding: MyPaddings.all12,
            decoration: BoxDecoration(
              borderRadius: MyBorderRadius.all16,
              gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xffBB8C52),
                  Color(0xffFFFFFF),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyBottomNavigationBarItem(
                  onTap: () => provider.changeCurrentIndex(3),
                  icon: Assets.iconsSvg.category,
                  selectedIcon: Assets.iconsSvg.categorySelected,
                  isSelected: provider.currentIndex == 3,
                  title: AppLocalizations.of(context)!.brand,
                ),
                MyBottomNavigationBarItem(
                  onTap: () => provider.changeCurrentIndex(2),
                  icon: Assets.iconsSvg.heart,
                  selectedIcon: Assets.iconsSvg.heartSelected,
                  isSelected: provider.currentIndex == 2,
                  title: AppLocalizations.of(context)!.favorite,
                ),
                MyBottomNavigationBarItem(
                  onTap: () => provider.changeCurrentIndex(1),
                  icon: Assets.iconsSvg.user,
                  selectedIcon: Assets.iconsSvg.userSelected,
                  isSelected: provider.currentIndex == 1,
                  title: AppLocalizations.of(context)!.profile,
                ),
                MyBottomNavigationBarItem(
                  onTap: () => provider.changeCurrentIndex(0),
                  icon: Assets.iconsSvg.home,
                  selectedIcon: Assets.iconsSvg.homeSelected,
                  isSelected: provider.currentIndex == 0,
                  title: AppLocalizations.of(context)!.appName,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
