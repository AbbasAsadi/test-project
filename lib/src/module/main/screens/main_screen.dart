import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/src/module/cart/screen/cart_screen.dart';
import 'package:test_project/src/module/favorite/screen/favorite_screen.dart';
import 'package:test_project/src/module/home/screens/home.dart';
import 'package:test_project/src/module/main/components/my_bottom_navigation.dart';
import 'package:test_project/src/module/main/providers/main_provider.dart';
import 'package:test_project/src/module/profile/screen/profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => MainProvider(),
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
    ], child: _MainScreen());
  }
}

class _MainScreen extends StatefulWidget {
  const _MainScreen();

  @override
  State<_MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<_MainScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: getCurrentScreen(),
        ),
        MyBottomNavigation()
      ],
    );
  }

  Widget getCurrentScreen() {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        switch (provider.currentIndex) {
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
      },
    );
  }

  changeCurrentIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
