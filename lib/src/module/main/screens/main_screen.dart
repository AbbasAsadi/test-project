import 'package:flutter/material.dart';
import 'package:gandom/src/component/custom_widget/my_loading_widget.dart';
import 'package:gandom/src/component/my_error_widget.dart';
import 'package:gandom/src/component/server_error_widget.dart';
import 'package:gandom/src/core/constants/my_colors.dart';
import 'package:gandom/src/core/constants/my_dimensions.dart';
import 'package:gandom/src/core/routing/my_pages.dart';
import 'package:gandom/src/modules/brands/provider/brand_provider.dart';
import 'package:gandom/src/modules/cart/provider/cart_provider.dart';
import 'package:gandom/src/modules/category/provider/category_provider.dart';
import 'package:gandom/src/modules/favorite/provider/favorite_provider.dart';
import 'package:gandom/src/modules/main/components/main_drawer.dart';
import 'package:gandom/src/modules/main/components/multi_landscape/mobile_main_widget.dart';
import 'package:gandom/src/modules/main/components/multi_landscape/tablet_main_widget.dart';
import 'package:gandom/src/modules/main/providers/main_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../../../Sample/test_project/lib/src/core/api/dio_response.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, this.currentIndex});

  final int? currentIndex;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) {
              var provider = MainProvider();
              if (currentIndex != null) {
                provider.changeCurrentIndex(currentIndex!);
              }
              return provider;
            },
          ),
          ChangeNotifierProvider(
            create: (_) => CategoryProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => FavoriteProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => BrandProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) {
              var provider = CartProvider();
              provider.readCartPK();
              return provider;
            },
          ),
        ],
        child: Builder(builder: (context) {
          return Scaffold(
            key: Provider.of<MainProvider>(context).scaffoldKey,
            backgroundColor: MyColors.primaryDark,
            drawerEnableOpenDragGesture: false,
            drawer: const MainDrawer(),
            body: const _MainScreen(),
          );
        }));
  }
}

class _MainScreen extends StatefulWidget {
  const _MainScreen({super.key});

  @override
  State<_MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<_MainScreen> {
  @override
  void initState() {
    Provider.of<MainProvider>(context, listen: false).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<MainProvider>(context).profileFuture,
      builder: (_, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return const MyLoadingWidget();
          case ConnectionState.done:
            if (snapshot.data != null) {
              switch (snapshot.data?.status) {
                case DioResponseStatus.success:
                  Provider.of<MainProvider>(context)
                      .saveProfileData(snapshot.data?.data);
                  return _successfulWidget(context);
                case DioResponseStatus.failure:
                    return MyErrorWidget(
                        errorMessage: snapshot.data?.data['detail'],
                        onRetryClicked: () {
                          setState(() {
                            Provider.of<MainProvider>(context).init();
                          });
                        });
                case DioResponseStatus.unauthorized:
                  context.go(MyPages.welcome);
                  return Container();
                case DioResponseStatus.serverError:
                  return ServerErrorWidget(
                    onRetryClicked: () {
                      setState(() {
                        Provider.of<MainProvider>(context).init();
                      });
                    },
                  );

                case DioResponseStatus.unknown:
                case null:
                  return const SizedBox();
              }
            } else {
              return Container();
            }
        }
      },
    );
  }

  Widget _successfulWidget(BuildContext context) {
    return (MediaQuery.of(context).size.shortestSide >
            MyDimensions.minTabletSize)
        ? const TabletMainWidget()
        : const MobileMainWidget();
  }
}
