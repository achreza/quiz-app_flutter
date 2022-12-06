import 'dart:io';

import 'package:get/get.dart';
import 'package:self_care_app/app/data/dto/requests/save_quiz_request.dart';
import 'package:self_care_app/constant.dart';

class QuizService extends GetConnect {
  final String saveQuizUrl = '${apiBaseUrl}quizSave';

  Future<String> saveQuiz(SaveQuizRequestModel model) async {
    final response = await post(saveQuizUrl, model.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return "success";
    } else {
      return "gagal";
    }
  }
}
