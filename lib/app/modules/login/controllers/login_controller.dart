import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_care_app/app/data/dto/requests/login_request.dart';
import 'package:self_care_app/app/data/dto/requests/register_request.dart';
import 'package:self_care_app/app/data/models/user.dart';
import 'package:self_care_app/app/data/services/login_service.dart';
import 'package:self_care_app/app/routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  late final LoginService _loginService;

  @override
  void onInit() {
    super.onInit();
    _loginService = Get.put(LoginService());
  }

  Future<void> loginUser(String uname, String password) async {
    final response = await _loginService
        .fetchLogin(LoginRequestModel(uname: uname, password: password));

    if (response != null) {
      Message dataUser = Message.fromJson(response.message!.toJson());
      Get.offAndToNamed(Routes.WELCOME, arguments: dataUser);
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'User not found!',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }

  Future<void> loginAdmin(String uname, String password) async {
    final response = await _loginService
        .adminLogin(LoginRequestModel(uname: uname, password: password));

    if (response != null) {
      Message dataUser = Message.fromJson(response.message!.toJson());
      Get.offAndToNamed(Routes.ADMIN);
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'User not found!',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }

  Future<void> registerUser(String uname, String email, String password) async {
    final response = await _loginService.fetchRegister(
        RegisterRequestModel(uname: uname, email: email, password: password));

    if (response != null) {
      Get.offAndToNamed(Routes.LOGIN);
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'Register Error',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }
}
