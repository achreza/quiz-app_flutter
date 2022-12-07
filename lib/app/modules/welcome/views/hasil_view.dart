import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:self_care_app/app/modules/welcome/controllers/welcome_controller.dart';

class HasilView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HasilView'),
        centerTitle: true,
      ),
      body: Center(
        child: controller.sudahTerisi.value == false
            ? Text("Anda Belum Mengisi Quiz", style: TextStyle(fontSize: 20))
            : Container(
                height: double.infinity,
                child: Column(
                  children: [
                    Text(
                      "Total Skor : ${controller.hasilQuiz!.data!.totalSkor.toString()}",
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      height: 500,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: controller.hasilQuiz!.result!.length,
                          itemBuilder: (context, index) {
                            int idQuiz = int.parse(controller
                                .hasilQuiz!.result![index].idQuiz
                                .toString());
                            int idHasil = int.parse(controller
                                .hasilQuiz!.result![index].idHasil
                                .toString());
                            return ListTile(
                              leading: Text((index + 1).toString()),
                              title: Text(
                                  controller.questions[idQuiz - 1].question),
                              subtitle: Text(controller
                                  .questions[idQuiz - 1].options[idHasil]),
                            );
                          }),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
