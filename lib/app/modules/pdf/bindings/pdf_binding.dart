import 'package:get/get.dart';
import 'package:self_care_app/app/modules/pdf/controllers/pdf_controller.dart';
import 'package:self_care_app/app/modules/question/controllers/question_controller.dart';

class PdfBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionController>(
      () => QuestionController(),
    );
    Get.lazyPut<PdfController>(
      () => PdfController(),
    );
  }
}
