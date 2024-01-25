import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:test_project/gen/assets.gen.dart';
import 'package:test_project/src/core/constants/my_dimensions.dart';
import 'package:test_project/src/module/product_detail/components/add_to_cart_widget.dart';
import 'package:test_project/src/module/product_detail/components/circular_back_button.dart';
import 'package:test_project/src/module/product_detail/components/coffee_size_row_widget.dart';
import 'package:test_project/src/module/product_detail/components/product_feature_widget.dart';
import 'package:test_project/src/module/product_detail/components/product_title_widget.dart';
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
            const CircularBackButton(),
            Container(
              color: Colors.black.withOpacity(.3),
              margin: const EdgeInsets.only(top: 245),
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  const ProductTitleWidget(),
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
                          const ProductFeatureWidget(),
                          Gap(MyDimensions.large),
                          Text(
                            'Coffee Size',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Gap(MyDimensions.medium),
                          const CoffeeSizeRowWidget(),
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
                          const AddToCartWidget(),
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