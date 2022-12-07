import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:self_care_app/app/modules/question/controllers/question_controller.dart';
import 'package:self_care_app/app/routes/app_pages.dart';
import 'package:self_care_app/constant.dart';

class ScoreScreen extends GetView<QuestionController> {
  @override
  Widget build(BuildContext context) {
    var hasil =
        controller.totalPoint.value <= 94 && controller.totalPoint.value >= 47
            ? "Rendah"
            : controller.totalPoint.value <= 141 &&
                    controller.totalPoint.value >= 95
                ? "Sedang"
                : "Tinggi";

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text(
                "${controller.totalPoint.value}",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text(
                "${hasil}",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: kSecondaryColor),
              ),
              Spacer(flex: 3),
              TextButton(
                  onPressed: () {
                    Get.offAndToNamed(Routes.WELCOME,
                        arguments: controller.datauser);
                  },
                  child: Text(
                    "Kembali ke menu utama",
                    style: TextStyle(fontSize: 16),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
