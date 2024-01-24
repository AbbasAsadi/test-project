import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gandom/src/core/constants/my_dimensions.dart';
import 'package:gap/gap.dart';

class MyBottomNavigationBarItem extends StatelessWidget {
  const MyBottomNavigationBarItem({
    super.key, required this.title, required this.icon, required this.isSelected, required this.selectedIcon, required this.onTap,
  });

  final String title;
  final String icon;
  final String selectedIcon;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(isSelected ? selectedIcon :icon),
          Gap(MyDimensions.light),
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontWeight: isSelected ? FontWeight.w700: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
