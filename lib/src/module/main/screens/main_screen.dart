import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/src/core/constants/my_colors.dart';
import 'package:test_project/src/module/main/components/my_bottom_navigation.dart';
import 'package:test_project/src/module/main/providers/main_provider.dart';


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
  const _MainScreen({super.key});

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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 22, top: 30, right: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            const SizedBox(height: 25),
            Text(
              'Find the best',
              style: Apptheme.tileLarge,
            ),
            Text(
              'coffe for you',
              style: Apptheme.tileLarge,
            ),
            const SizedBox(height: 28),
            const SearchWidget(),
            const SizedBox(height: 25),
            // Chips
            SizedBox(
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: DataTmp.chips.length,
                itemBuilder: (BuildContext context, int index) {
                  final coffe = DataTmp.chips[index];
                  bool isActive = true;
                  if (index != 0) {
                    isActive = false;
                  }
                  return Padding(
                    padding: const EdgeInsets.only(right: 27),
                    child: Column(
                      children: [
                        Text(
                          coffe,
                          style: isActive
                              ? Apptheme.chipActive
                              : Apptheme.chipInactive,
                        ),
                        const SizedBox(height: 2),
                        Icon(
                          Icons.circle,
                          color: isActive
                              ? Apptheme.iconActiveColor
                              : Colors.transparent,
                          size: 12,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // ListView
            Expanded(
              child: ListView(
                children: [
                  //Vertical Card
                  SizedBox(
                    height: 247,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: DataTmp.coffeeList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return VerticalCardWidget(
                          coffee: DataTmp.coffeeList[index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text('Special for you', style: Apptheme.subtileLarge),
                  const SizedBox(height: 17),
                  //Horizonal Card
                  SizedBox(
                    height: 350,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return const HorizontalCardWidget();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


