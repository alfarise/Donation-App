import 'package:get/get.dart';
import 'package:praktikum/app/modules/bindings.dart';
import 'package:praktikum/app/modules/login/bindings/login_binding.dart';
import 'package:praktikum/app/modules/login/views/login_view.dart';
import 'package:praktikum/app/modules/views.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;
  static const DASHBOARD = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.START_CAMPAIGN,
      page: () => const StartCampaignView(),
      binding: StartCampaignBinding(),
    ),
    GetPage(
      name: _Paths.ALL_CAMPAIGN,
      page: () => const AllCampaignView(),
      binding: AllCampaignBinding(),
    ),
    GetPage(
      name: _Paths.TODOS,
      page: () => const TodoView(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
        name: _Paths.LOGIN,
        page: () => const LoginView(),
        binding: LoginBinding()
    ),
  ];
}
