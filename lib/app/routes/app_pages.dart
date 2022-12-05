import 'package:get/get.dart';

import 'package:self_care_app/app/modules/admin/bindings/admin_binding.dart';
import 'package:self_care_app/app/modules/admin/views/admin_view.dart';
import 'package:self_care_app/app/modules/home/bindings/home_binding.dart';
import 'package:self_care_app/app/modules/home/views/home_view.dart';
import 'package:self_care_app/app/modules/login/bindings/login_binding.dart';
import 'package:self_care_app/app/modules/login/views/login_view.dart';
import 'package:self_care_app/app/modules/question/bindings/question_binding.dart';
import 'package:self_care_app/app/modules/question/views/question_view.dart';
import 'package:self_care_app/app/modules/welcome/bindings/welcome_binding.dart';
import 'package:self_care_app/app/modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.QUESTION,
      page: () => QuestionView(),
      binding: QuestionBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => AdminView(),
      binding: AdminBinding(),
    ),
  ];
}
