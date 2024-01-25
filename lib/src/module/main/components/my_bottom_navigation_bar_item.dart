import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:test_project/src/core/constants/my_colors.dart';
import 'package:test_project/src/core/constants/my_dimensions.dart';

class MyBottomNavigationBarItem extends StatelessWidget {
  const MyBottomNavigationBarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          isSelected
              ? Container(
                  width: MyDimensions.large,
                  height: MyDimensions.small,
                  color: MyColors.primary,
                )
              : Gap(MyDimensions.small),
          Gap(
            MyDimensions.medium,
          ),
          SvgPicture.asset(icon,
              height: MyDimensions.semiLarge,
              colorFilter: isSelected
                  ? const ColorFilter.mode(MyColors.primary, BlendMode.srcIn)
                  : const ColorFilter.mode(MyColors.grey_30, BlendMode.srcIn)),
          Gap(MyDimensions.light),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: isSelected ? MyColors.primary : MyColors.grey_30),
          ),
        ],
      ),
    );
  }
}
