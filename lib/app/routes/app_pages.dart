import 'package:get/get.dart';
import 'package:qti/app/modules/add_asset/views/add_asset_view.dart';
import 'package:qti/app/modules/home/bindings/home_binding.dart';
import 'package:qti/app/modules/home/views/home_view.dart';
import '../../app/middleware/app_auth_sign_middleware.dart';
import '../modules/add_asset/bindings/add_Asset_binding.dart';
import '../modules/auth/sign_in/bindings/sign_in_binding.dart';
import '../modules/auth/sign_in/views/sign_in_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/asset/bindings/asset_binding.dart';
import '../modules/asset/views/asset_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.dashboard;

  static final routes = [
    GetPage(
      name: _Paths.dashboard,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
      middlewares: [AppAuthSignMiddleware()],
    ),
    GetPage(
      name: _Paths.signIn,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.asset,
      page: () => const AssetView(),
      binding: AssetBinding(),
    ),
    GetPage(
      name: _Paths.addAsset,
      page: () => const AddAssetView(),
      binding: AddAssetBinding(),
    ),
  ];
}
