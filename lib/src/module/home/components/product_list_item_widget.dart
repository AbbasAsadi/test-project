import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:test_project/gen/assets.gen.dart';
import 'package:test_project/src/core/constants/my_border_radius.dart';
import 'package:test_project/src/core/constants/my_colors.dart';
import 'package:test_project/src/core/constants/my_dimensions.dart';
import 'package:test_project/src/core/routing/my_pages.dart';

class ProductListItemWidget extends StatelessWidget {
  const ProductListItemWidget({
    super.key,
    required this.childItem,
  });

  final Map<String, dynamic> childItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(MyPages.productDetailScreen, extra: childItem['id']);
      },
      child: Card(
        borderOnForeground: true,
        shape: RoundedRectangleBorder(borderRadius: MyBorderRadius.all16),
        color: Colors.white,
        child: Column(
          children: [
            ClipRRect(
                borderRadius: MyBorderRadius.all16,
                child: Stack(
                  children: [
                    Hero(
                      transitionOnUserGestures: true,
                      tag: "image${childItem['id']}",
                      child: Image.asset(
                        childItem['image']!,
                        width: 140,
                        height: 99,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: MyDimensions.light,
                      right: MyDimensions.light,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: MyDimensions.small,
                            vertical: MyDimensions.small / 2),
                        decoration: BoxDecoration(
                            color: MyColors.primary,
                            borderRadius:
                                BorderRadius.circular(MyDimensions.xxLarge)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(Assets.icons.star),
                            Gap(MyDimensions.small),
                            Text(
                              '4.9',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w300,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        childItem['title']!,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(fontSize: 16),
                      ),
                      Text(childItem['description']!,
                          style: Theme.of(context).textTheme.displaySmall),
                      Text(childItem['price']!,
                          style: Theme.of(context).textTheme.titleSmall),
                    ],
                  ),
                  Gap(MyDimensions.medium),
                  Container(
                    padding: EdgeInsets.all(MyDimensions.light),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: MyColors.primary),
                    child: SvgPicture.asset(Assets.icons.add),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
