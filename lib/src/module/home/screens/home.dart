import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:test_project/gen/assets.gen.dart';
import 'package:test_project/src/core/constants/my_border_radius.dart';
import 'package:test_project/src/core/constants/my_colors.dart';
import 'package:test_project/src/core/constants/my_dimensions.dart';
import 'package:test_project/src/core/constants/my_paddings.dart';
import 'package:test_project/src/module/home/components/app_bar_widget.dart';
import 'package:test_project/src/module/home/components/category_list_item_widget.dart';
import 'package:test_project/src/module/home/components/product_list_item_widget.dart';
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
                const AppBarWidget(),
                Gap(MyDimensions.medium),
                Padding(
                  padding: MyPaddings.horizontalLarge,
                  child: Text(
                    'Good morning, Dityo',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Gap(MyDimensions.large),
                const SearchWidget(),
                Gap(MyDimensions.semiLarge),
                Padding(
                  padding: MyPaddings.horizontalLarge,
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
                        padding: MyPaddings.horizontalLarge,
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
                        padding: MyPaddings.horizontalLarge,
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            provider.selectedCategoryItem['items'].length,
                        separatorBuilder: (context, index) =>
                            Gap(MyDimensions.medium),
                        itemBuilder: (context, index) {
                          Map<String, dynamic> childItem =
                              provider.selectedCategoryItem['items'][index];
                          return ProductListItemWidget(childItem: childItem);
                        },
                      );
                    },
                  ),
                ),
                Gap(MyDimensions.xLarge),
                Padding(
                  padding: MyPaddings.horizontalLarge,
                  child: Row(
                    children: [
                      Text(
                        'Special Offer',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Gap(MyDimensions.small),
                      SvgPicture.asset(
                        Assets.icons.fire,
                        height: MyDimensions.medium + MyDimensions.small,
                      ),
                    ],
                  ),
                ),
                Gap(MyDimensions.light),
                Card(
                  elevation: 5,
                  color: Colors.white,
                  borderOnForeground: true,
                  margin: MyPaddings.horizontalLarge,
                  shape: RoundedRectangleBorder(
                    borderRadius: MyBorderRadius.all16,
                  ),
                  child: Padding(
                    padding: MyPaddings.allLight,
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
                                    borderRadius: MyBorderRadius.allXXLarge),
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
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
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
