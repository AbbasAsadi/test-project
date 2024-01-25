import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:test_project/gen/assets.gen.dart';
import 'package:test_project/src/core/constants/my_border_radius.dart';
import 'package:test_project/src/core/constants/my_colors.dart';
import 'package:test_project/src/core/constants/my_dimensions.dart';
import 'package:test_project/src/core/constants/my_paddings.dart';

class ProductTitleWidget extends StatelessWidget {
  const ProductTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            padding: MyPaddings.allLight,
            decoration: BoxDecoration(
                color: MyColors.primary,
                borderRadius:
                MyBorderRadius.allXXLarge),
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
    );
  }
}
