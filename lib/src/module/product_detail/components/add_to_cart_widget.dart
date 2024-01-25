import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:test_project/src/core/constants/my_border_radius.dart';
import 'package:test_project/src/core/constants/my_colors.dart';
import 'package:test_project/src/core/constants/my_dimensions.dart';

class AddToCartWidget extends StatelessWidget {
  const AddToCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: MyDimensions.semiLarge),
      decoration: BoxDecoration(
        borderRadius:
        MyBorderRadius.allXXLarge,
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
            '50\$',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.white),
          ),
          Gap(MyDimensions.xLarge),
        ],
      ),
    );
  }
}
