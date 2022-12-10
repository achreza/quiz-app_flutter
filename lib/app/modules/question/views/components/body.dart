import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_svg/svg.dart';
import 'package:self_care_app/constant.dart';

import '../../controllers/question_controller.dart';
import 'progress_bar.dart';
import 'question_card.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    var controller = Get.find<QuestionController>();
    return Stack(
      children: [
        SvgPicture.asset(
          "assets/icons/bg.svg",
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              //   child: ProgressBar(),
              // ),
              // SizedBox(height: kDefaultPadding),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text: "Pertanyaan ${controller.questionNumber.value}",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: kSecondaryColor),
                      children: [
                        TextSpan(
                          text: "/${controller.questions.length}",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: kSecondaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: kDefaultPadding),
              Expanded(
                child: PageView.builder(
                  // Block swipe to next qn
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller.pageController,
                  onPageChanged: controller.updateTheQnNum,
                  itemCount: controller.questions.length,
                  itemBuilder: (context, index) =>
                      QuestionCard(question: controller.questions[index]),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
