import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:test_project/gen/assets.gen.dart';
import 'package:test_project/src/component/custom_widget/my_network_image.dart';
import 'package:test_project/src/core/constants/my_border_radius.dart';
import 'package:test_project/src/core/constants/my_colors.dart';
import 'package:test_project/src/core/constants/my_dimensions.dart';
import 'package:test_project/src/module/home/components/category_list_item_widget.dart';
import 'package:test_project/src/module/home/components/search_widget.dart';
import 'package:test_project/src/module/home/providers/home_provider.dart';
import 'package:test_project/src/module/main/providers/main_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => HomeProvider(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(MyDimensions.xLarge),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap(MyDimensions.large),
                    const ClipOval(
                      child: MyNetworkImage(
                        'https://i.imgur.com/uTjWuc8.jpg',
                        width: 60,
                        height: 60,
                      ),
                    ),
                    Gap(MyDimensions.xLarge),
                    SvgPicture.asset(
                      Assets.icons.location,
                      width: 13.75,
                    ),
                    Gap(MyDimensions.small),
                    Text(
                      'Bintara, Bekasi',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: Colors.black),
                    ),
                    const Spacer(),
                    SvgPicture.asset(Assets.icons.notification),
                    Gap(MyDimensions.large),
                  ],
                ),
                Gap(MyDimensions.medium),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MyDimensions.large),
                  child: Text(
                    'Good morning, Dityo',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Gap(MyDimensions.large),
                const SearchWidget(),
                Gap(MyDimensions.semiLarge),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MyDimensions.large),
                  child: Text(
                    'Categories',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Gap(MyDimensions.semiLarge),
                SizedBox(
                  height: MyDimensions.large,
                  child: Consumer<MainProvider>(
                    builder: (_, provider, child) {
                      return ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                            horizontal: MyDimensions.large),
                        scrollDirection: Axis.horizontal,
                        itemCount: provider.categoryList.length,
                        separatorBuilder: (context, index) =>
                            Gap(MyDimensions.xLight),
                        itemBuilder: (context, index) {
                          provider.selectedCategoryItem =
                              provider.categoryList[index];
                          return CategoryListItemWidget(
                            title: provider.selectedCategoryItem["title"],
                            icon: provider.selectedCategoryItem["icon"],
                            isSelected: provider.currentCategoryIndex == index,
                            onTap: () => provider.changeCategoryIndex(index),
                          );
                        },
                      );
                    },
                  ),
                ),
                Gap(MyDimensions.medium),
                SizedBox(
                  height: 165,
                  child: Consumer<MainProvider>(
                    builder: (_, provider, child) {
                      return ListView.separated(
                        controller: provider.childCategoryListItemController,
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                            horizontal: MyDimensions.large),
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            provider.selectedCategoryItem['items'].length,
                        separatorBuilder: (context, index) =>
                            Gap(MyDimensions.medium),
                        itemBuilder: (context, index) {
                          Map<String, dynamic> childItem =
                              provider.selectedCategoryItem['items'][index];
                          return Card(
                            borderOnForeground: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: MyBorderRadius.all16),
                            color: Colors.white,
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: MyBorderRadius.all16,
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          childItem['image']!,
                                          width: 140,
                                          height: 99,
                                          fit: BoxFit.cover,
                                        ),
                                        Positioned(
                                          top: MyDimensions.light,
                                          right: MyDimensions.light,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: MyDimensions.small,
                                                vertical:
                                                    MyDimensions.small / 2),
                                            decoration: BoxDecoration(
                                                color: MyColors.primary,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        MyDimensions.xxLarge)),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SvgPicture.asset(
                                                    Assets.icons.star),
                                                Gap(MyDimensions.small),
                                                Text(
                                                  '4.9',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall
                                                      ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color: Colors.white),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                                Padding(
                                  padding: EdgeInsets.all(MyDimensions.light),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            childItem['title']!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge
                                                ?.copyWith(fontSize: 16),
                                          ),
                                          Text(childItem['description']!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall),
                                          Text(childItem['price']!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall),
                                        ],
                                      ),
                                      Gap(MyDimensions.medium),
                                      Container(
                                        padding:
                                            EdgeInsets.all(MyDimensions.light),
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: MyColors.primary),
                                        child:
                                            SvgPicture.asset(Assets.icons.add),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Gap(MyDimensions.xLarge),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MyDimensions.large),
                  child: Row(
                    children: [
                      Text(
                        'Special Offer',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Gap(MyDimensions.small),
                      SvgPicture.asset(
                        Assets.icons.fire,
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Gap(MyDimensions.light),
                Card(
                  elevation: 5,
                  color: Colors.white,
                  borderOnForeground: true,
                  margin: EdgeInsets.symmetric(horizontal: MyDimensions.large),
                  shape: RoundedRectangleBorder(
                    borderRadius: MyBorderRadius.all16,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(MyDimensions.light),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: MyBorderRadius.all16,
                          child: Image.asset(
                            Assets.images.cappuccino3.path,
                            width: 138,
                            height: 106,
                          ),
                        ),
                        Gap(MyDimensions.xLight),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: MyDimensions.light,
                                    vertical: MyDimensions.small / 2),
                                decoration: BoxDecoration(
                                    color: MyColors.primary,
                                    borderRadius: BorderRadius.circular(
                                        MyDimensions.xxLarge)),
                                child: Text(
                                  'Limited',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(color: Colors.white),
                                ),
                              ),
                              Gap(MyDimensions.xLight),
                              Text(
                                'Buy 1 get 1 free if you buy with Gopay',
                                style: Theme.of(context).textTheme.headlineLarge,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Gap(MyDimensions.xLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
