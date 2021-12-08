import 'package:get/get.dart';
import 'package:get_x/app/modules/home/bindings/home_bindings.dart';
import 'package:get_x/app/modules/home/view/home_view.dart';
import 'package:get_x/app/modules/location/bindings/location_bindings.dart';
import 'package:get_x/app/modules/location/view/location_view.dart';
import 'package:get_x/app/modules/login/bindings/login_bindings.dart';
import 'package:get_x/app/modules/login/view/login_view.dart';
import 'package:get_x/app/modules/profile/bindings/profile_bindings.dart';
import 'package:get_x/app/modules/profile/view/profile_view.dart';
import 'package:get_x/app/modules/register/bindings/register_bindings.dart';
import 'package:get_x/app/modules/register/view/register_view.dart';
import 'package:get_x/app/routes/app_routes.dart';

class AppPages {
  static const INITIAL = Routes.INITIAL;

  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const HomeView(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterView(),
      binding: RegisterBindings(),
    ),
    GetPage(
      name: Routes.location,
      page: () => const LocationView(),
      binding: LocationBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfileView(),
      binding: ProfileBindings(),
    ),
    GetPage(
        name: Routes.login,
        page: () => const LoginView(),
        binding: LoginBindings())
  ];
}
