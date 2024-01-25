import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:test_project/src/core/constants/my_colors.dart';
import 'package:test_project/src/core/constants/my_dimensions.dart';

class CategoryListItemWidget extends StatefulWidget {
  const CategoryListItemWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap,
      required this.isSelected});

  final String title;
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<CategoryListItemWidget> createState() => _CategoryListItemWidgetState();
}

class _CategoryListItemWidgetState extends State<CategoryListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(MyDimensions.light),
        decoration: BoxDecoration(
            color: widget.isSelected ? MyColors.primary : Colors.white,
            borderRadius: BorderRadius.circular(MyDimensions.xxLarge)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              widget.icon,
              colorFilter: ColorFilter.mode(
                widget.isSelected ? Colors.white : MyColors.grey_90,
                BlendMode.srcIn,
              ),
            ),
            Gap(MyDimensions.small),
            Text(
              widget.title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: widget.isSelected ? Colors.white : MyColors.grey_90,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
