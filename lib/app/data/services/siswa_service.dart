import 'dart:io';

import 'package:get/get.dart';
import 'package:self_care_app/app/data/dto/requests/edit_data_siswa_request.dart';
import 'package:self_care_app/app/data/dto/requests/edit_password_siswa_request.dart';
import 'package:self_care_app/app/data/dto/responses/reset_password_response.dart';
import 'package:self_care_app/app/data/models/list_siswa.dart';
import 'package:self_care_app/app/data/models/siswa.dart';
import 'package:self_care_app/constant.dart';

class SiswaService extends GetConnect {
  final String allSiswa = '${apiBaseUrl}listSiswa';
  final String resetPasswordUrl = '${apiBaseUrl}resetPasswordSiswa/';
  final String editDataSiswaUrl = '${apiBaseUrl}editDataSiswa/';
  final String editPasswordSiswaUrl = '${apiBaseUrl}editPasswordSiswa/';
  final String detailSiswaUrl = '${apiBaseUrl}detailSiswa/';

  Future<ListSiswaModel?> getAllData() async {
    final response = await get(allSiswa);

    if (response.statusCode == HttpStatus.ok) {
      return ListSiswaModel.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<SiswaModel?> getDetailSiswa(String id) async {
    final response = await get(detailSiswaUrl + id);

    if (response.statusCode == HttpStatus.ok) {
      return SiswaModel.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<String> resetPassword(int id) async {
    final response = await get(resetPasswordUrl + id.toString());
    ResetPasswordResponse data = ResetPasswordResponse.fromJson(response.body);

    if (response.statusCode == HttpStatus.ok) {
      return data.message.toString();
    } else {
      return "Ubah Password Gagal";
    }
  }

  Future<String?> editDataSiswa(int id, EditDataSiswaRequest model) async {
    print(model.toJson());
    final response =
        await post(editDataSiswaUrl + id.toString(), model.toJson());
    // print(response.body);

    if (response.statusCode == HttpStatus.ok) {
      return "Berhasil";
    } else {
      return null;
    }
  }

  Future<String?> editPasswordSiswa(
      String id, EditPasswordSiswaRequest model) async {
    print(model.toJson());
    final response = await post(editPasswordSiswaUrl + id, model.toJson());
    // print(response.body);

    if (response.statusCode == HttpStatus.ok) {
      return response.body['message'];
    } else {
      return response.body['message'];
    }
  }
}
