import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/pdf_controller.dart';

class PdfView extends GetView<PdfController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              controller.deleteQuiz(controller.quizData.id.toString());
            },
          ),
        ],
      ),
      body: Obx(() => Center(
            child: controller.isLoading.value == true
                ? CircularProgressIndicator()
                : Container(
                    height: double.infinity,
                    child: Column(
                      children: [
                        Container(
                            width: 300,
                            height: 50,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                                "Nama : ${controller.detailSiswa!.nama.toString()}",
                                style: TextStyle(color: Colors.black))),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            width: 300,
                            height: 50,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                                "Tanggal Lahir : ${controller.detailSiswa!.tgl_lahir.toString()}",
                                style: TextStyle(color: Colors.black))),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            width: 300,
                            height: 50,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                                "Email : ${controller.detailSiswa!.email.toString()}",
                                style: TextStyle(color: Colors.black))),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            width: 300,
                            height: 50,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                                "Sekolah : ${controller.detailSiswa!.sekolah.toString()}",
                                style: TextStyle(color: Colors.black))),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            width: 300,
                            height: 50,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                                "NISN : ${controller.detailSiswa!.nisn.toString()}",
                                style: TextStyle(color: Colors.black))),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            width: 300,
                            height: 50,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                                "Kelas : ${controller.detailSiswa!.kelas.toString()}",
                                style: TextStyle(color: Colors.black))),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            width: 300,
                            height: 50,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                                controller.detailSiswa!.jk.toString() == "L"
                                    ? "Jenis Kelamin : Laki-Laki"
                                    : "Jenis Kelamin :Perempuan",
                                style: TextStyle(color: Colors.black))),
                        SizedBox(
                          height: 5,
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
          )),
    );
  }
}
