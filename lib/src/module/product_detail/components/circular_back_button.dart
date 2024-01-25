import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_project/gen/assets.gen.dart';
import 'package:test_project/src/core/constants/my_dimensions.dart';
import 'package:test_project/src/core/constants/my_paddings.dart';
class CircularBackButton extends StatelessWidget {
  const CircularBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MyDimensions.xLarge,
      left: MyDimensions.semiLarge,
      child: InkWell(
        onTap: () => context.pop(),
        child: Container(
          padding: MyPaddings.allLight,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Colors.white),
          child: SvgPicture.asset(Assets.icons.back),
        ),
      ),
    );
  }
}
