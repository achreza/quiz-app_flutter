import 'dart:ffi';
import 'dart:io';

import 'package:get/get.dart';
import 'package:self_care_app/app/data/dto/requests/save_quiz_request.dart';
import 'package:self_care_app/app/data/dto/responses/hasil_quiz_response.dart';
import 'package:self_care_app/app/data/dto/responses/list_pengisi.dart';
import 'package:self_care_app/constant.dart';

class QuizService extends GetConnect {
  final String saveQuizUrl = '${apiBaseUrl}quizSave';
  final String listPengisiUrl = '${apiBaseUrl}listPengisi';
  final String quizTiapSiswaUrl = '${apiBaseUrl}quizResult/';

  Future<String> saveQuiz(SaveQuizRequestModel model) async {
    final response = await post(saveQuizUrl, model.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return "success";
    } else {
      return "gagal";
    }
  }

  Future<bool> quizTiapSiswa(String id) async {
    final response = await get(quizTiapSiswaUrl + id);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<HasilQuizResponse?> respoonseQuizTiapSiswa(String id) async {
    final response = await get(quizTiapSiswaUrl + id);
    final HasilQuizResponse data = HasilQuizResponse.fromJson(response.body);

    if (response.statusCode == 200) {
      return data;
    } else {
      return null;
    }
  }

  Future<ListPengisiModel?> getAllPengisi() async {
    final response = await get(listPengisiUrl);
    final ListPengisiModel datas = ListPengisiModel.fromJson(response.body);

    if (response.statusCode == HttpStatus.ok) {
      return datas;
    } else {
      return null;
    }
  }
}
