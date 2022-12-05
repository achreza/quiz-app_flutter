import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:self_care_app/app/data/dto/requests/login_request.dart';
import 'package:self_care_app/app/data/dto/responses/login_response.dart';
import 'package:self_care_app/constant.dart';

import '../dto/requests/register_request.dart';
import '../dto/responses/register_response.dart';

class LoginService extends GetConnect {
  final String loginUrl = '${apiBaseUrl}loginSiswa';
  final String registerUrl = '${apiBaseUrl}daftarSiswa';

  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    final response = await post(loginUrl, model.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return LoginResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<RegisterResponseModel?> fetchRegister(
      RegisterRequestModel model) async {
    final response = await post(registerUrl, model.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return RegisterResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
