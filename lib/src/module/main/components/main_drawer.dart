import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gandom/gen/assets.gen.dart';
import 'package:gandom/src/component/custom_widget/my_loading_widget.dart';
import 'package:gandom/src/core/constants/my_border_radius.dart';
import 'package:gandom/src/core/constants/my_colors.dart';
import 'package:gandom/src/core/constants/my_dimensions.dart';
import 'package:gandom/src/core/constants/my_paddings.dart';
import 'package:gandom/src/core/routing/my_pages.dart';
import 'package:gandom/src/core/ui_utils.dart';
import 'package:gandom/src/modules/login/api/login_api_routes.dart';
import 'package:gandom/src/modules/main/providers/main_provider.dart';
import 'package:gandom/src/modules/profile/api/model/profile_response.dart';
import 'package:gandom/src/modules/profile/api/model/user_type.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../Sample/test_project/lib/src/core/api/dio_method.dart';
import '../../../../../../../Sample/test_project/lib/src/core/api/dio_util.dart';
import '../../../../../../../Sample/test_project/lib/src/core/secure_storage/my_secure_storage.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        height: UIUtils.getScreenHeight(context),
        child: FutureBuilder<SharedPreferences>(
          future: SharedPreferences.getInstance(),
          builder: (_, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return const Center(
                  child: MyLoadingWidget(),
                );
              case ConnectionState.done:
                SharedPreferences? pref = snapshot.data;
                if (pref != null) {
                  var data = pref.getString('profile');
                  ProfileResponse profileResponse =
                      ProfileResponse.fromJson(json.decode(data!));
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            MyDimensions.medium,
                            MyDimensions.xLarge,
                            MyDimensions.medium,
                            0,
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                Assets.images.gandomLogo.path,
                                width: UIUtils.getConvertedWidth(context, 39),
                              ),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(children: [
                                    TextSpan(
                                        text: profileResponse.fullName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall),
                                    TextSpan(
                                        text: ' عزیز شما با شماره تماس ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall),
                                    TextSpan(
                                        text: profileResponse.phoneNumber,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall),
                                    TextSpan(
                                        text: ' وارد برنامه ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall),
                                    TextSpan(
                                        text: 'گندم',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall
                                            ?.copyWith(
                                                color: MyColors.textColorGold)),
                                    TextSpan(
                                        text: ' شده اید.',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall),
                                  ]),
                                ),
                              )
                            ],
                          ),
                        ),
                        Gap(MyDimensions.xLarge),
                        const Divider(
                          color: MyColors.grey_40,
                          thickness: 1,
                        ),
                        ListTile(
                          onTap: () => context.push(MyPages.cartScreen),
                          leading: SvgPicture.asset(Assets.iconsSvg.cart),
                          title: Text(
                            'سبد خرید',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.grey_80),
                          ),
                          trailing: SvgPicture.asset(
                            Assets.iconsSvg.arrowLeft2,
                          ),
                        ),
                        Divider(
                          color: MyColors.grey_40,
                          thickness: 1,
                          endIndent: MyDimensions.medium,
                          indent: MyDimensions.medium,
                        ),
                        ListTile(
                          onTap: () =>
                              context.push(MyPages.pendingPurchaseListScreen),
                          leading: SvgPicture.asset(Assets.iconsSvg.bookmark),
                          title: Text(
                            'در انتظار خرید',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.grey_80),
                          ),
                          trailing: SvgPicture.asset(
                            Assets.iconsSvg.arrowLeft2,
                          ),
                        ),
                        Divider(
                          color: MyColors.grey_40,
                          thickness: 1,
                          endIndent: MyDimensions.medium,
                          indent: MyDimensions.medium,
                        ),
                        ListTile(
                          onTap: () =>
                              context.push(MyPages.purchaseHistoryScreen),
                          leading: SvgPicture.asset(Assets.iconsSvg.factor),
                          title: Text(
                            'سابقه خرید شما',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.grey_80),
                          ),
                          trailing: SvgPicture.asset(
                            Assets.iconsSvg.arrowLeft2,
                          ),
                        ),
                        Divider(
                          color: MyColors.grey_40,
                          thickness: 1,
                          endIndent: MyDimensions.medium,
                          indent: MyDimensions.medium,
                        ),
                        ListTile(
                          onTap: () => context.push(MyPages.chatScreen),
                          leading: SvgPicture.asset(Assets.iconsSvg.chat),
                          title: Text(
                            'پشتیبانی آنلاین',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.grey_80),
                          ),
                          trailing: SvgPicture.asset(
                            Assets.iconsSvg.arrowLeft2,
                          ),
                        ),
                        Divider(
                          color: MyColors.grey_40,
                          thickness: 1,
                          endIndent: MyDimensions.medium,
                          indent: MyDimensions.medium,
                        ),
                        ListTile(
                          onTap: () => context.push(MyPages.supportScreen),
                          leading: SvgPicture.asset(Assets.iconsSvg.calling),
                          title: Text(
                            'تماس با پشتیبانی',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.grey_80),
                          ),
                          trailing: SvgPicture.asset(
                            Assets.iconsSvg.arrowLeft2,
                          ),
                        ),
                        Divider(
                          color: MyColors.grey_40,
                          thickness: 1,
                          endIndent: MyDimensions.medium,
                          indent: MyDimensions.medium,
                        ),
                        if (profileResponse.type == UserType.marketer.value)
                          ListTile(
                            onTap: () =>
                                context.push(MyPages.subcategoryStoresScreen),
                            leading: SvgPicture.asset(Assets.iconsSvg.factor),
                            title: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'زیرمجموعه ویزیتور ها',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: MyColors.grey_80),
                                  ),
                                  TextSpan(
                                    text: '(مخصوص ویزیتور)',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: MyColors.grey_80),
                                  ),
                                ],
                              ),
                            ),
                            trailing: SvgPicture.asset(
                              Assets.iconsSvg.arrowLeft2,
                            ),
                          ),
                        if (profileResponse.type == UserType.marketer.value)
                          Divider(
                          color: MyColors.grey_40,
                          thickness: 1,
                          endIndent: MyDimensions.medium,
                          indent: MyDimensions.medium,
                        ),
                        ListTile(
                          leading: SvgPicture.asset(Assets.iconsSvg.edit),
                          title: Text(
                            'درباره گندم',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.grey_80),
                          ),
                          trailing: SvgPicture.asset(
                            Assets.iconsSvg.arrowLeft2,
                          ),
                        ),
                        const Gap(200),
                        ListTile(
                          onTap: () async {
                            return await showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: MyBorderRadius.all12),
                                content: SizedBox(
                                  height: 300,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                          child: Image.asset(
                                              Assets.images.logout.path)),
                                      Gap(MyDimensions.xLight),
                                      Text(
                                        'خروج از حساب کاربری',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w900),
                                      ),
                                      Gap(MyDimensions.medium),
                                      SizedBox(
                                        width: UIUtils.getScreenWidth(context) *
                                            .7,
                                        child: Text(
                                          'شما در حال خروج از حساب کاربری خود هستید.\n برای خروج مطمئن هستید؟',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actionsAlignment: MainAxisAlignment.center,
                                actions: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () =>
                                              Navigator.of(context).pop(false),
                                          child: Container(
                                            padding: MyPaddings.all8,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: MyColors.primary),
                                              borderRadius: MyBorderRadius.all5,
                                            ),
                                            child: Text(
                                              'بیخیال',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.copyWith(
                                                      color: MyColors.primary,
                                                      fontSize: 14),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Gap(MyDimensions.medium),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            context.pop();
                                            LoadingWidget.showSimpleLoading(
                                                context);
                                            DioUtil()
                                                .request(LoginApiRoutes.logout,
                                                    method: DioMethod.post)
                                                .then((value) {
                                              MySecureStorage.getInstance()
                                                  .clearToken()
                                                  .then(
                                                (value) async {
                                                  await Provider.of<
                                                              MainProvider>(
                                                          context,
                                                          listen: false)
                                                      .clearUserData();

                                                  context.pop();
                                                  context.push(MyPages.welcome);
                                                },
                                              );
                                            });
                                          },
                                          child: Container(
                                            padding: MyPaddings.all8,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: MyColors.primary,
                                              borderRadius: MyBorderRadius.all5,
                                            ),
                                            child: Text(
                                              'بله',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.copyWith(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 14),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          leading: SvgPicture.asset(Assets.iconsSvg.signOut),
                          title: Text(
                            'خروج از حساب',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.grey_80),
                          ),
                          trailing: SvgPicture.asset(
                            Assets.iconsSvg.arrowLeft2,
                          ),
                        ),
                        Gap(MyDimensions.semiLarge),
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
            }
          },
        ),
      ),
    );
  }
}
