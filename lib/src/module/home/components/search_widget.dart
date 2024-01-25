import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/gen/assets.gen.dart';
import 'package:test_project/src/core/constants/my_colors.dart';
import 'package:test_project/src/core/constants/my_dimensions.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: MyDimensions.large),
      child: TextFormField(
        maxLines: 1,
        textInputAction: TextInputAction.search,
        style: Theme.of(context).textTheme.displayMedium,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          hintText: 'Search Coffee..',
          hintStyle: Theme.of(context).textTheme.displayMedium?.copyWith(color: MyColors.hintColor),
          fillColor: MyColors.grey_10,
          filled: true,
          contentPadding: EdgeInsets.all(MyDimensions.medium),
          suffixIcon: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: MyDimensions.medium),
            child: SvgPicture.asset(Assets.icons.filter),
          ),
          prefixIcon: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: MyDimensions.medium),
            child: SvgPicture.asset(Assets.icons.search),
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: MyDimensions.semiLarge),
          suffixIconConstraints: BoxConstraints(maxHeight: MyDimensions.semiLarge),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(MyDimensions.xxLarge),
            borderSide: const BorderSide(width: 1, color: MyColors.grey_30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(MyDimensions.xxLarge),
            borderSide: const BorderSide(width: 1, color: MyColors.primary),
          ),
        ),
      ),
    );
  }
}
