
import 'package:go_router/go_router.dart';
import 'package:test_project/src/core/routing/my_pages.dart';

class MyRoutes {
  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
          path: MyPages.splash,
          builder: (context, state) => const SplashScreen()),
      GoRoute(
          path: MyPages.main,
          builder: (context, state) {
            int? index = state.extra as int?;
            return MainScreen(
              currentIndex: index,
            );
          }),
      GoRoute(
          path: MyPages.productDetailScreen,
          builder: (context, state) {
            int id = state.extra as int;
            return ProductDetailScreen(
              productID: id,
            );
          }),
    ],
  );
}
