
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/src/module/home/providers/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: SafeArea(
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
      ),
    );
  }
}
