import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:test_project/gen/assets.gen.dart';
import 'package:test_project/src/core/constants/my_border_radius.dart';
import 'package:test_project/src/core/constants/my_colors.dart';
import 'package:test_project/src/core/constants/my_dimensions.dart';
import 'package:test_project/src/module/product_detail/provider/product_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.productID});

  final int productID;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProductProvider(productID.toString()),
      child: Scaffold(
        body: Stack(
          children: [
            Hero(
              tag: "image$productID",
              child: Image.asset(
                Assets.images.cappuccino1.path,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: MyDimensions.xLarge,
              left: MyDimensions.semiLarge,
              child: InkWell(
                onTap: () => context.pop(),
                child: Container(
                  padding: EdgeInsets.all(MyDimensions.light),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: SvgPicture.asset(Assets.icons.back),
                ),
              ),
            ),
            Container(
              color: Colors.black.withOpacity(.3),
              margin: const EdgeInsets.only(top: 245),
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MyDimensions.semiLarge),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(MyDimensions.light),
                            Text(
                              'Cappuccino',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: Colors.white),
                            ),
                            Text(
                              'With Chocolate',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.all(MyDimensions.light),
                          decoration: BoxDecoration(
                              color: MyColors.primary,
                              borderRadius:
                                  BorderRadius.circular(MyDimensions.xxLarge)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                Assets.icons.star,
                                height: MyDimensions.medium,
                              ),
                              Gap(MyDimensions.small),
                              Text(
                                '4.9',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(
                      MyDimensions.medium + MyDimensions.small,
                      MyDimensions.medium + MyDimensions.small,
                      MyDimensions.medium + MyDimensions.small,
                      0,
                    ),
                    margin: EdgeInsets.only(top: MyDimensions.xxLarge),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(MyDimensions.xLarge),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(MyDimensions.semiLarge),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(MyDimensions.xxLarge),
                                color: MyColors.grey_40),
                            child: Row(
                              children: [
                                SvgPicture.asset(Assets.icons.coffee),
                                Text(
                                  'Coffee',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                const Spacer(),
                                Container(
                                  width: 1,
                                  height: MyDimensions.semiLarge,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: MyBorderRadius.all16,
                                  ),
                                ),
                                const Spacer(),
                                SvgPicture.asset(Assets.icons.chocolate),
                                Text(
                                  'Chocolate',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                const Spacer(),
                                Container(
                                  width: 1,
                                  height: MyDimensions.semiLarge,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: MyBorderRadius.all16,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  'Medium Roasted',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                          ),
                          Gap(MyDimensions.large),
                          Text(
                            'Coffee Size',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Gap(MyDimensions.medium),
                          Consumer<ProductProvider>(
                            builder: (context, provider, child) {
                              return Row(
                                children: [
                                  InkWell(
                                    onTap: () => provider.changeCoffeeSize(0),
                                    child: Card(
                                      surfaceTintColor: Colors.white,
                                      color: provider.selectedSizeIndex == 0
                                          ? MyColors.primary
                                          : Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            MyDimensions.xLarge),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: MyDimensions.semiLarge,
                                            vertical: MyDimensions.light),
                                        child: Text(
                                          'Small',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                  fontSize: MyDimensions.medium,
                                                  color:
                                                      provider.selectedSizeIndex ==
                                                              0
                                                          ? Colors.white
                                                          : MyColors.grey_90),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () => provider.changeCoffeeSize(1),
                                    child: Card(
                                      surfaceTintColor: Colors.white,
                                      color: provider.selectedSizeIndex == 1
                                          ? MyColors.primary
                                          : Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            MyDimensions.xLarge),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: MyDimensions.semiLarge,
                                            vertical: MyDimensions.light),
                                        child: Text(
                                          'Medium',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                  fontSize: MyDimensions.medium,
                                                  color:
                                                      provider.selectedSizeIndex ==
                                                              1
                                                          ? Colors.white
                                                          : MyColors.grey_90),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () => provider.changeCoffeeSize(2),
                                    child: Card(
                                      surfaceTintColor: Colors.white,
                                      color: provider.selectedSizeIndex == 2
                                          ? MyColors.primary
                                          : Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            MyDimensions.xLarge),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: MyDimensions.semiLarge,
                                            vertical: MyDimensions.light),
                                        child: Text(
                                          'Large',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                  fontSize: MyDimensions.medium,
                                                  color:
                                                      provider.selectedSizeIndex ==
                                                              2
                                                          ? Colors.white
                                                          : MyColors.grey_90),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          Gap(MyDimensions.large),
                          Text(
                            'About',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Gap(MyDimensions.light),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum vivamus velit lorem amet. Tincidunt cras volutpat aliquam porttitor molestie. Netus neque, habitasse id vulputate proin cras. Neque, vel duis sit vel pellentesque tempor. A commodo arcu tortor arcu, elit.",
                            textAlign: TextAlign.justify,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  height: 1.11,
                                ),
                          ),
                          Gap(MyDimensions.semiLarge),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: MyDimensions.semiLarge),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(MyDimensions.xxLarge),
                              color: MyColors.primary,
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Gap(MyDimensions.xLarge),
                                Text(
                                  'Add to Cart',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge
                                      ?.copyWith(color: Colors.white),
                                ),
                                const Spacer(),
                                const Spacer(),
                                Container(
                                  width: 1,
                                  height: MyDimensions.semiLarge,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: MyBorderRadius.all16,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  '50 \$',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(color: Colors.white),
                                ),
                                Gap(MyDimensions.xLarge),
                              ],
                            ),
                          ),
                          Gap(MyDimensions.medium + MyDimensions.small)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
