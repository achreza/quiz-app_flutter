import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:self_care_app/app/modules/question/controllers/question_controller.dart';
import 'package:self_care_app/app/routes/app_pages.dart';
import 'package:self_care_app/constant.dart';

class ScoreScreen extends GetView<QuestionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HASIL',
            style: TextStyle(
                fontSize: 24, letterSpacing: 2, fontWeight: FontWeight.w800)),
        centerTitle: true,
      ),
      body: Center(
        child: controller.sudahTerisi.value == false
            ? Text("Anda Belum Mengisi Quiz", style: TextStyle(fontSize: 20))
            : Container(
                height: double.infinity,
                child: Column(
                  children: [
                    Container(
                      height: 450,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: controller.hasilQuiz!.result!.length,
                          itemBuilder: (context, index) {
                            int idQuiz = int.parse(controller
                                .hasilQuiz!.result![index].idQuiz
                                .toString());
                            int idHasil = int.parse(controller
                                .hasilQuiz!.result![index].indexAnswer
                                .toString());
                            return ListTile(
                              leading: Text((index + 1).toString()),
                              title: Text(
                                  controller.questions[idQuiz - 1].question),
                              subtitle: Text(controller
                                  .questions[idQuiz - 1].options[idHasil]),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.getPdf();
                      },
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          width: 300,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Color(0xFFffc300),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "LIHAT PDF",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
