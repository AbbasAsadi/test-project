import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:test_project/gen/assets.gen.dart';
import 'package:test_project/src/component/custom_widget/my_network_image.dart';
import 'package:test_project/src/core/constants/my_dimensions.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gap(MyDimensions.large),
        const ClipOval(
          child: MyNetworkImage(
            'https://i.imgur.com/uTjWuc8.jpg',
            width: 60,
            height: 60,
          ),
        ),
        Gap(MyDimensions.xLarge),
        SvgPicture.asset(
          Assets.icons.location,
          width: 13.75,
        ),
        Gap(MyDimensions.small),
        Text(
          'Bintara, Bekasi',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.black),
        ),
        const Spacer(),
        SvgPicture.asset(Assets.icons.notification),
        Gap(MyDimensions.large),
      ],
    );
  }
}
