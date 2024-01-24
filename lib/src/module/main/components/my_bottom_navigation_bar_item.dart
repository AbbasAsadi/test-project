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
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(icon,
              colorFilter: isSelected
                  ? const ColorFilter.mode(MyColors.primary, BlendMode.src)
                  : null),
          Gap(MyDimensions.light),
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
        ],
      ),
    );
  }
}
