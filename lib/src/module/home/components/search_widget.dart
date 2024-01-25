import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/gen/assets.gen.dart';
import 'package:test_project/src/core/constants/my_border_radius.dart';
import 'package:test_project/src/core/constants/my_colors.dart';
import 'package:test_project/src/core/constants/my_dimensions.dart';
import 'package:test_project/src/core/constants/my_paddings.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: MyPaddings.horizontalLarge,
      child: TextFormField(
        maxLines: 1,
        textInputAction: TextInputAction.search,
        style: Theme.of(context).textTheme.displayMedium,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          hintText: 'Search Coffee..',
          hintStyle: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(color: MyColors.hintColor),
          fillColor: MyColors.grey_10,
          filled: true,
          contentPadding: MyPaddings.allMedium,
          suffixIcon: Padding(
            padding: MyPaddings.horizontalMedium,
            child: SvgPicture.asset(Assets.icons.filter),
          ),
          prefixIcon: Padding(
            padding: MyPaddings.horizontalMedium,
            child: SvgPicture.asset(Assets.icons.search),
          ),
          prefixIconConstraints:
              BoxConstraints(maxHeight: MyDimensions.semiLarge),
          suffixIconConstraints:
              BoxConstraints(maxHeight: MyDimensions.semiLarge),
          enabledBorder: OutlineInputBorder(
            borderRadius: MyBorderRadius.allXXLarge,
            borderSide: const BorderSide(width: 1, color: MyColors.grey_30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: MyBorderRadius.allXXLarge,
            borderSide: const BorderSide(width: 1, color: MyColors.primary),
          ),
        ),
      ),
    );
  }
}
