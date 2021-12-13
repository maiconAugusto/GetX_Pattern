import 'package:get/get.dart';
import 'package:get_x/app/modules/chat/bindings/chat_bindings.dart';
import 'package:get_x/app/modules/chat/view/chat_view.dart';
import 'package:get_x/app/modules/chat_list/bindings/chat_list_bindings.dart';
import 'package:get_x/app/modules/chat_list/view/chat_list.dart';
import 'package:get_x/app/modules/dashboard/bindings/dashboard_bindings.dart';
import 'package:get_x/app/modules/dashboard/view/dashboard_view.dart';
import 'package:get_x/app/modules/home/bindings/home_bindings.dart';
import 'package:get_x/app/modules/home/view/home_view.dart';
import 'package:get_x/app/modules/location/bindings/location_bindings.dart';
import 'package:get_x/app/modules/location/view/location_view.dart';
import 'package:get_x/app/modules/login/bindings/login_bindings.dart';
import 'package:get_x/app/modules/login/view/login_view.dart';
import 'package:get_x/app/modules/menu/bindings/menu_bindings.dart';
import 'package:get_x/app/modules/menu/view/menu_view.dart';
import 'package:get_x/app/modules/my_data/bindings/my_data_bindings.dart';
import 'package:get_x/app/modules/my_data/view/my_data_view.dart';
import 'package:get_x/app/modules/password/bindings/password_bindings.dart';
import 'package:get_x/app/modules/password/view/password_view.dart';
import 'package:get_x/app/modules/profile/bindings/profile_bindings.dart';
import 'package:get_x/app/modules/profile/view/profile_view.dart';
import 'package:get_x/app/modules/register/view/success_view.dart';
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
      name: Routes.chat,
      page: () => const ChatView(),
      binding: ChatBindings(),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardView(),
      binding: DashboardBindings(),
    ),
    GetPage(
      name: Routes.chatlist,
      page: () => const ChatListView(),
      binding: ChatListBindings(),
    ),
    GetPage(
      name: Routes.mydata,
      page: () => const MyDataView(),
      binding: MyDataBindings(),
    ),
    GetPage(
      name: Routes.menu,
      page: () => const MenuView(),
      binding: MenuBindings(),
    ),
    GetPage(
      name: Routes.password,
      page: () => const PasswordView(),
      binding: PasswordBindings(),
    ),
    GetPage(
      name: Routes.sucessRegister,
      page: () => const SuccessView(),
      binding: RegisterBindings(),
    ),
    GetPage(
        name: Routes.login,
        page: () => const LoginView(),
        binding: LoginBindings())
  ];
}
