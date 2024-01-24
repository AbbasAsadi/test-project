import 'package:flutter/material.dart';
import 'package:gandom/src/core/constants/my_dimensions.dart';
import 'package:gandom/src/modules/brands/screens/brands_screen.dart';
import 'package:gandom/src/modules/category/screens/category_screen.dart';
import 'package:gandom/src/modules/favorite/screens/favorite_screen.dart';
import 'package:gandom/src/modules/home/components/footer_widget.dart';
import 'package:gandom/src/modules/home/components/search_bar_widget.dart';
import 'package:gandom/src/modules/home/screens/home.dart';
import 'package:gandom/src/modules/main/components/my_bottom_navigation.dart';
import 'package:gandom/src/modules/main/providers/main_provider.dart';
import 'package:gandom/src/modules/profile/screen/profile_screen.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class MobileMainWidget extends StatelessWidget {
  const MobileMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (_, provider, child) {
        return WillPopScope(
          onWillPop: () => provider.backButton(context),
          child: Stack(
            children: [
              Column(
                children: [
                  const FooterWidget(),
                  if (provider.currentIndex == 0) Gap(MyDimensions.medium),
                  if (provider.currentIndex == 0) const SearchBarWidget(),
                  Gap(MyDimensions.semiLarge),
                  getCurrentScreen(
                    provider.currentIndex,
                    provider.showCategoryLayer,
                  ),
                ],
              ),
              const MyBottomNavigation(),
            ],
          ),
        );
      },
    );
  }

  Widget getCurrentScreen(int selectedIndex, bool showCategoryLayer) {
    switch (selectedIndex) {
      case 0:
        if (showCategoryLayer) {
          return const CategoryScreen();
        } else {
          return const HomeScreen();
        }
      case 1:
        return const ProfileScreen();

      case 2:
        return const FavoriteScreen();
      case 3:
        if (showCategoryLayer) {
          return const CategoryScreen();
        } else {
          return const BrandsScreen();
        }
      default:
        if (showCategoryLayer) {
          return const CategoryScreen();
        } else {
          return const HomeScreen();
        }
    }
  }
}
