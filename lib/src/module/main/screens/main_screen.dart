import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/src/core/constants/my_colors.dart';
import 'package:test_project/src/module/cart/screen/cart_screen.dart';
import 'package:test_project/src/module/favorite/screen/favorite_screen.dart';
import 'package:test_project/src/module/home/screens/home.dart';
import 'package:test_project/src/module/main/components/my_bottom_navigation.dart';
import 'package:test_project/src/module/main/providers/main_provider.dart';
import 'package:test_project/src/module/profile/screen/profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, this.currentIndex});

  final int? currentIndex;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) {
              var provider = MainProvider();
              if (currentIndex != null) {
                provider.changeCurrentIndex(currentIndex!);
              }
              return provider;
            },
          ),
          /*
          ChangeNotifierProvider(
            create: (_) => FavoriteProvider(),
          ),

          ChangeNotifierProvider(
            create: (_) {
              var provider = CartProvider();
              provider.readCartPK();
              return provider;
            },
          ),
          ChangeNotifierProvider(
            create: (_) => ProfileProvider(),
          ),
          */
        ],
        child: Builder(builder: (context) {
          return Scaffold(
            key: Provider.of<MainProvider>(context).scaffoldKey,
            backgroundColor: MyColors.primaryDark,
            drawerEnableOpenDragGesture: false,
            body: const _MainScreen(),
            bottomNavigationBar: const MyBottomNavigation(),
          );
        }));
  }
}

class _MainScreen extends StatefulWidget {
  const _MainScreen();

  @override
  State<_MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<_MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            getCurrentScreen(
              provider.currentIndex,
              provider.showCategoryLayer,
            )
          ],
        );
      },
    );
  }

  Widget getCurrentScreen(int selectedIndex, bool showCategoryLayer) {
    switch (selectedIndex) {
      case 0:
        return const HomeScreen();

      case 1:
        return const FavoriteScreen();
      case 2:
        return const CartScreen();
      case 3:
        return const ProfileScreen();
      default:
        return const HomeScreen();
    }
  }
}
