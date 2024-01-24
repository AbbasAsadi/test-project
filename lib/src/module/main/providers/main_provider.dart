import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gandom/gen/assets.gen.dart';
import 'package:gandom/src/core/constants/my_border_radius.dart';
import 'package:gandom/src/core/constants/my_colors.dart';
import 'package:gandom/src/core/constants/my_dimensions.dart';
import 'package:gandom/src/core/constants/my_paddings.dart';
import 'package:gandom/src/core/provider/safe_provider.dart';
import 'package:gandom/src/core/ui_utils.dart';
import 'package:gandom/src/modules/category/provider/category_provider.dart';
import 'package:gandom/src/modules/profile/api/profile_api_routes.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../Sample/test_project/lib/src/core/api/dio_method.dart';
import '../../../../../../../Sample/test_project/lib/src/core/api/dio_response.dart';
import '../../../../../../../Sample/test_project/lib/src/core/api/dio_util.dart';

class MainProvider extends SafeProvider {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  int currentIndex = 0;
  bool showCategoryLayer = false;
  Future<DioResponse>? profileFuture;
  void init() {
    profileFuture = getProfile();
  }


  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void changeCurrentIndex(int index) {
    if (showCategoryLayer) {
      showCategoryLayer = false;
      notifyListeners();
    } else if (currentIndex != index) {
      currentIndex = index;
      showCategoryLayer = false;
      notifyListeners();
    }
  }

  Future<DioResponse> getProfile() async {
    return DioUtil().request(
      ProfileApiRoutes.getProfileData,
      method: DioMethod.get,
    );
  }

  Future<void> saveProfileData(dynamic data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('profile', json.encode(data));
  }

  Future<void> clearUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
  }

  void goToSpecificCategoryPage(
      BuildContext context, String title, String? type, int? categoryID) {
    setShowCategoryLayer(true);
    Provider.of<CategoryProvider>(context, listen: false)
        .initial(title: title, type: type, categoryID: categoryID);
  }

  void setShowCategoryLayer(bool showCategoryLayer) {
    this.showCategoryLayer = showCategoryLayer;
    notifyListeners();
  }

  Future<bool> backButton(BuildContext context) async {
    if (showCategoryLayer) {
      setShowCategoryLayer(false);
    } else {
      if (currentIndex == 0) {
        return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: MyBorderRadius.all12),
            content: SizedBox(
              height: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: Image.asset(Assets.images.logout.path)),
                  Gap(MyDimensions.xLight),
                  Text(
                    'خروج از اپلیکیشن',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  Gap(MyDimensions.medium),
                  SizedBox(
                    width: UIUtils.getScreenWidth(context) * .5,
                    child: Text(
                      'شما در حال خروج از اپلیکیشن هستید.\n برای خروج مطمئن هستید؟',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium,
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
                      onTap: () => Navigator.of(context).pop(false),
                      child: Container(
                        padding: MyPaddings.all8,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: MyColors.primary),
                          borderRadius: MyBorderRadius.all5,
                        ),
                        child: Text(
                          'بیخیال',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: MyColors.primary,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  Gap(MyDimensions.medium),
                  Expanded(
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(true),
                      child: Container(
                        padding: MyPaddings.all8,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: MyColors.primary,
                          borderRadius: MyBorderRadius.all5,
                        ),
                        child: Text(
                          'بله',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
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
      } else {
        changeCurrentIndex(0);
      }
    }
    return await false;
  }

}
