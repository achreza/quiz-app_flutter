import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:self_care_app/app/data/dto/responses/detail_pdf_response.dart';
import 'package:self_care_app/app/data/dto/responses/hasil_quiz_response.dart';
import 'package:self_care_app/app/data/models/question.dart';
import 'package:self_care_app/app/data/models/siswa.dart';
import 'package:self_care_app/app/data/services/quiz_service.dart';
import 'package:self_care_app/app/data/services/siswa_service.dart';

import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement PdfController

  final GlobalKey<FormState> formKey = GlobalKey();

  final count = 0.obs;
  RxBool sudahTerisi = false.obs;
  RxBool isLoading = true.obs;
  QuizService? _quizService;
  SiswaService? _siswaService;

  SiswaModel? detailSiswa;

  HasilQuizResponse? hasilQuiz;
  String idSiswa = Get.arguments;

  List<String> selfContact = [
    "Anda memiliki self-contact yang kurang. Hal ini menunjukkan bahwa Anda masih belum bisa memberi perhatian pada diri sendiri. ",
    "Anda memiliki self-contact yang baik. Hal ini menunjukkan bahwa Anda sudah cukup mampu untuk memberi perhatian pada diri sendiri. ",
    "Anda memiliki self-contact yang sangat baik. Hal ini menunjukkan bahwa Anda sudah mampu untuk memberi perhatian pada diri sendiri. "
  ];

  List<String> selfAcceptence = [
    "Anda memiliki self-acceptence yang kurang. Hal ini menunjukkan bahwa Anda masih belum bisa untuk menerima keadaan diri sendiri. ",
    "Anda memiliki self-acceptence yang baik. Hal ini menunjukkan bahwa Anda sudah cukup mampu untuk menerima keadaan diri sendiri. ",
    "Anda memiliki self-acceptence yang sangat baik. Hal ini menunjukkan bahwa Anda sudah mampu untuk menerima keadaan diri sendiri. "
  ];

  List<String> selfLove = [
    "Anda memiliki self-care yang kurang. Hal ini menunjukkan bahwa Anda masih belum bisa untuk merawat dan melidungi diri sendiri.",
    "Anda memiliki self-care yang baik. Hal ini menunjukkan bahwa Anda sudah cukup mampu untuk merawat dan melidungi diri sendiri.",
    "Anda memiliki self-care yang sangat baik. Hal ini menunjukkan bahwa Anda sudah mampu untuk merawat dan melidungi diri sendiri. "
  ];

  List<Question> questions = sample_data
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();

  void getHasilQuiz() async {
    HasilQuizResponse? response =
        await _quizService!.respoonseQuizTiapSiswa(idSiswa.toString());
    hasilQuiz = response;
    // print(idSiswa);
    isLoading(false);
  }

  void getDetailSiswa() async {
    print(idSiswa);
    SiswaModel? response = await _siswaService!.getDetailSiswa(idSiswa);
    detailSiswa = response;
    // print(idSiswa);
    isLoading(false);
  }

  void getPdf() async {
    DetailPdfResponse? response = await _quizService!.detailPdf(idSiswa);
    double persentase1 = double.parse(response!.persentase![0]);
    double persentase2 = double.parse(response!.persentase![1]);
    double persentase3 = double.parse(response!.persentase![2]);
    double persentase_total =
        double.parse(response!.persentase_total.toString());
    String tingkat = persentase_total >= 76
        ? "Tinggi"
        : persentase_total >= 51
            ? "Sedang"
            : "Rendah";
    print("persentase total : " + persentase_total.toString());
    final pdf = pw.Document();
    final image = pw.MemoryImage(
      (await rootBundle.load('assets/kop-fix.png')).buffer.asUint8List(),
    );
    pdf.addPage(pw.Page(build: (pw.Context context) {
      return pw.Container(
        child: pw.Column(children: [
          pw.Image(image),
          pw.SizedBox(height: 5),
          pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Container(),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Container(
                          decoration: pw.BoxDecoration(
                              color: PdfColors.white,
                              border: pw.Border(
                                bottom: pw.BorderSide(color: PdfColors.black),
                                top: pw.BorderSide(color: PdfColors.black),
                                left: pw.BorderSide(color: PdfColors.black),
                                right: pw.BorderSide(color: PdfColors.black),
                              )),
                          width: 120,
                          height: 30,
                          alignment: pw.Alignment.center,
                          child: pw.Text("RAHASIA",
                              style: pw.TextStyle(
                                  fontSize: 16, color: PdfColors.black))),
                      pw.SizedBox(height: 7),
                      pw.Container(
                          height: 30,
                          alignment: pw.Alignment.topLeft,
                          child: pw.Text("${response!.waktu}")),
                    ]),
              ]),
          pw.SizedBox(height: 5),
          pw.Center(
              child: pw.Text(
                  "LAPORAN HASIL PENGISIAN INVENTORI TINGKAT SELF-LOVE PADA SISWA SMA",
                  style: pw.TextStyle(
                      fontSize: 14, fontWeight: pw.FontWeight.bold),
                  textAlign: pw.TextAlign.center)),
          pw.SizedBox(height: 10),
          pw.Table(tableWidth: pw.TableWidth.max, children: [
            pw.TableRow(children: [
              pw.Column(
                children: [
                  pw.Container(
                      height: 17,
                      alignment: pw.Alignment.topLeft,
                      child: pw.Row(children: [
                        pw.Container(width: 60, child: pw.Text("Nama")),
                        pw.Container(width: 5, child: pw.Text(":")),
                        pw.Container(child: pw.Text("${response!.nama}")),
                      ]))
                ],
              ),
              pw.Column(
                children: [
                  pw.Container(
                      alignment: pw.Alignment.topLeft,
                      child: pw.Row(children: [
                        pw.Container(width: 90, child: pw.Text("Usia")),
                        pw.Container(width: 5, child: pw.Text(":")),
                        pw.Container(child: pw.Text("${response!.usia}")),
                      ]))
                ],
              ),
            ]),
            pw.TableRow(children: [
              pw.Column(
                children: [
                  pw.Container(
                      height: 17,
                      alignment: pw.Alignment.topLeft,
                      child: pw.Row(children: [
                        pw.Container(width: 60, child: pw.Text("NIS")),
                        pw.Container(width: 5, child: pw.Text(":")),
                        pw.Container(child: pw.Text("${response!.nisn}")),
                      ]))
                ],
              ),
              pw.Column(
                children: [
                  pw.Container(
                      alignment: pw.Alignment.topLeft,
                      child: pw.Row(children: [
                        pw.Container(
                            width: 90, child: pw.Text("Jenis Kelamin")),
                        pw.Container(width: 5, child: pw.Text(":")),
                        pw.Container(child: pw.Text("${response!.jk}")),
                      ]))
                ],
              ),
            ]),
            pw.TableRow(children: [
              pw.Column(
                children: [
                  pw.Container(
                      height: 17,
                      alignment: pw.Alignment.topLeft,
                      child: pw.Row(children: [
                        pw.Container(width: 60, child: pw.Text("Sekolah")),
                        pw.Container(width: 5, child: pw.Text(":")),
                        pw.Container(child: pw.Text("${response!.sekolah}")),
                      ]))
                ],
              ),
              pw.Column(
                children: [
                  pw.Container(
                      alignment: pw.Alignment.topLeft,
                      child: pw.Row(children: [
                        pw.Container(width: 90, child: pw.Text("Kelas")),
                        pw.Container(width: 5, child: pw.Text(":")),
                        pw.Container(child: pw.Text("${response!.kelas}")),
                      ]))
                ],
              ),
            ]),
            pw.TableRow(children: [
              pw.Column(
                children: [
                  pw.Container(
                      height: 17,
                      alignment: pw.Alignment.topLeft,
                      child: pw.Row(children: [
                        pw.Container(width: 60, child: pw.Text("Email")),
                        pw.Container(width: 5, child: pw.Text(":")),
                        pw.Container(child: pw.Text("${response!.email}")),
                      ]))
                ],
              ),
              pw.Column(
                children: [
                  pw.Container(
                      alignment: pw.Alignment.topLeft,
                      child: pw.Row(children: [
                        pw.Container(width: 90, child: pw.Text("Pengisian")),
                        pw.Container(width: 5, child: pw.Text(":")),
                        pw.Container(child: pw.Text("(1) Pretest")),
                      ]))
                ],
              ),
            ]),
          ]),
          pw.SizedBox(height: 10),
          pw.Container(height: 1, width: 1000, color: PdfColors.black),
          pw.SizedBox(height: 5),
          pw.Center(
              child: pw.Text("HASIL ANALISA",
                  style: pw.TextStyle(
                      fontSize: 14, fontWeight: pw.FontWeight.bold))),
          pw.SizedBox(height: 5),
          pw.Text(
              "Berdasarkan hasil pengisian yang telah dilakukan oleh ${response!.nama} pada inventori tingkat Self-Love siswa SMA, mendapatkan hasil sebgai berikut:"),
          pw.SizedBox(height: 10),
          pw.Container(
            alignment: pw.Alignment.center,
            width: 500,
            child: pw.Table(columnWidths: {
              0: pw.FlexColumnWidth(2),
              1: pw.FlexColumnWidth(2),
              2: pw.FlexColumnWidth(2),
              3: pw.FlexColumnWidth(4),
            }, children: [
              pw.TableRow(children: [
                pw.Container(
                    alignment: pw.Alignment.topLeft,
                    height: 18,
                    child: pw.Text('Indikator',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text('Persentase',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text('Klasifikasi',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text('Interpretasi',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
              ]),
              pw.TableRow(children: [
                pw.Container(
                    alignment: pw.Alignment.topLeft,
                    height: 18,
                    child: pw.Text('Self-Contract')),
                pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text('${persentase1} %')),
                pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text(persentase1 >= 76
                        ? "Tinggi"
                        : persentase1 >= 51
                            ? "Sedang"
                            : "Rendah")),
                pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text(persentase2 >= 76
                        ? selfContact[2]
                        : persentase2 >= 51
                            ? selfContact[1]
                            : selfContact[0])),
              ]),
              pw.TableRow(children: [
                pw.Container(
                    alignment: pw.Alignment.topLeft,
                    height: 18,
                    child: pw.Text('Self-Acceptance')),
                pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text('${persentase2} %')),
                pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text(persentase2 >= 76
                        ? "Tinggi"
                        : persentase2 >= 51
                            ? "Sedang"
                            : "Rendah")),
                pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text(persentase2 >= 76
                        ? selfAcceptence[2]
                        : persentase2 >= 51
                            ? selfAcceptence[1]
                            : selfAcceptence[0])),
              ]),
              pw.TableRow(children: [
                pw.Container(
                    alignment: pw.Alignment.topLeft,
                    height: 18,
                    child: pw.Text('Self-Care')),
                pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text('${persentase3} %')),
                pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text(persentase3 >= 76
                        ? "Tinggi"
                        : persentase3 >= 51
                            ? "Sedang"
                            : "Rendah")),
                pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text(persentase2 >= 76
                        ? selfLove[2]
                        : persentase2 >= 51
                            ? selfLove[1]
                            : selfLove[0])),
              ]),
            ]),
          ),
          pw.SizedBox(height: 5),
          pw.Text(
              "Dari data di atas, dapat diketahui bahwa  ${response!.nama}, memiliki tingkat self-love yang ${tingkat} Hal ini menunjukkan bahwa anda sudah mampu menerapkan self-love pada diri anda dengan sangat baik."),
        ]),
      ); // Center
    }));
    Uint8List bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/hasil${idSiswa}.pdf');

    await file.writeAsBytes(bytes);

    await OpenFile.open(file.path);
    // print('tapped');
  }

  @override
  void onInit() {
    super.onInit();
    isLoading(true);
    _quizService = Get.put<QuizService>(QuizService());
    _siswaService = Get.put<SiswaService>(SiswaService());
    // getHasilQuiz();
    getDetailSiswa();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
