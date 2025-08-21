import 'package:get/get.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/bindings/otp_binding.dart';
// import 'package:flutter_demo_app/app/modules/auth/bindings/otp_binding.dart';
import '../modules/auth/views/mobile_login_view.dart';
import '../modules/auth/views/otp_view.dart';
import '../modules/counter/bindings/counter_binding.dart';
import '../modules/counter/views/counter_view.dart';
import '../modules/crud/bindings/crud_binding.dart';
import '../modules/crud/views/crud_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/permissions/bindings/permissions_binding.dart';
import '../modules/permissions/views/permissions_view.dart';
import '../modules/tictactoe/bindings/tictactoe_binding.dart';
import '../modules/tictactoe/views/tictactoe_view.dart';
import '../modules/tutorial/bindings/tutorial_binding.dart';
import '../modules/tutorial/views/tutorial_view.dart';
import '../modules/upcoming/views/upcoming_view.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: '/login',
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: '/mobile-login',
      page: () => MobileLoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: '/otp',
      page: () => OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: '/home',
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/counter',
      page: () => CounterView(),
      binding: CounterBinding(),
    ),
    GetPage(
      name: '/crud',
      page: () => CrudView(),
      binding: CrudBinding(),
    ),
    GetPage(
      name: '/permissions',
      page: () => PermissionsView(),
      binding: PermissionsBinding(),
    ),
    GetPage(
      name: '/tictactoe',
      page: () => TicTacToeView(),
      binding: TicTacToeBinding(),
    ),
    GetPage(
      name: '/tutorial',
      page: () => TutorialView(),
      binding: TutorialBinding(),
    ),
    GetPage(
      name: '/upcoming',
      page: () => const UpcomingView(),
    ),
  ];
}
