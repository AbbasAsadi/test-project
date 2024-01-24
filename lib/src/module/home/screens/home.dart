import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:test_project/gen/assets.gen.dart';
import 'package:test_project/src/component/custom_widget/my_network_image.dart';
import 'package:test_project/src/core/constants/my_colors.dart';
import 'package:test_project/src/core/constants/my_dimensions.dart';
import 'package:test_project/src/module/home/providers/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(MyDimensions.xLarge+10),
                const ClipOval(
                  child: MyNetworkImage(
                    'https://i.imgur.com/uTjWuc8.jpg', width: 60, height: 60,),
                ),
                Gap(MyDimensions.xLarge),
                SvgPicture.asset(Assets.icons.location, width: 13.75,),
                Gap(MyDimensions.small),
                Text(
                  'Bintara, Bekasi',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Colors.black),
                ),
                const Spacer(),
                SvgPicture.asset(Assets.icons.notification),
                Gap(MyDimensions.xLarge+10),
              ],
            ),
            Gap(MyDimensions.medium),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: ShapeDecoration(
                color: MyColors.grey_10,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFCBCBD4)),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: TextFormField(
                decoration: InputDecoration(

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
