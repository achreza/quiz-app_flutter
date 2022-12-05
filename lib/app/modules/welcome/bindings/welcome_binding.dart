import 'package:get/get.dart';
import 'package:self_care_app/app/modules/question/controllers/question_controller.dart';

import '../controllers/welcome_controller.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(
      () => WelcomeController(),
    );
    Get.lazyPut<QuestionController>(
      () => QuestionController(),
    );
  }
}
