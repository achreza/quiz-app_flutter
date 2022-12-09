import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/pdf_controller.dart';

class PdfView extends GetView<PdfController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF'),
        centerTitle: true,
      ),
      body: Obx(() => Center(
            child: controller.isLoading.value == true
                ? CircularProgressIndicator()
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
                                  title: Text(controller
                                      .questions[idQuiz - 1].question),
                                  subtitle: Text(controller
                                      .questions[idQuiz - 1].options[idHasil]),
                                );
                              }),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: (() {
                              controller.getPdf();
                            }),
                            child: Container(
                              alignment: Alignment.center,
                              width: 300,
                              height: 50,
                              color: Colors.blue,
                              child: Text(
                                "Hasil",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
          )),
    );
  }
}
