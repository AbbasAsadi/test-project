import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/gen/assets.gen.dart';
import 'package:test_project/src/core/constants/my_border_radius.dart';
import 'package:test_project/src/core/constants/my_colors.dart';
import 'package:test_project/src/core/constants/my_dimensions.dart';

class ProductFeatureWidget extends StatelessWidget {
  const ProductFeatureWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}