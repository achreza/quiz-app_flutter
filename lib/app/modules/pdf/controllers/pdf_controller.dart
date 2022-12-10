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
    final pdf = pw.Document();
    final image = pw.MemoryImage(
      (await rootBundle.load('assets/kop-um.jpg')).buffer.asUint8List(),
    );
    pdf.addPage(pw.Page(build: (pw.Context context) {
      return pw.Container(
        child: pw.Column(children: [
          pw.Image(image),
          pw.SizedBox(height: 5),
          pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Container(
                    height: 30,
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text("${response!.waktu}")),
                pw.Container(
                    width: 150,
                    height: 30,
                    color: PdfColors.black,
                    alignment: pw.Alignment.center,
                    child: pw.Text("RAHASIA",
                        style:
                            pw.TextStyle(fontSize: 18, color: PdfColors.white)))
              ]),
          pw.SizedBox(height: 10),
          pw.Center(
              child: pw.Text("LAPORAN HASIL SKALA STRES AKADEMIK SISWA SMA",
                  style: pw.TextStyle(
                      fontSize: 14, fontWeight: pw.FontWeight.bold))),
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
              "Berdasakan hasil pengisian skala stres akademik siswa SMA, ${response!.nama} memiliki tingkat stres akademik pada skor ${persentase_total}% dalam kategori ${tingkat}. Secara lebih rinci, hasil pengisian ${response!.nama} dipaparkan dalam tabel berikut."),
          pw.SizedBox(height: 10),
          pw.Container(
            alignment: pw.Alignment.center,
            width: 400,
            child: pw.Table(children: [
              pw.TableRow(children: [
                pw.Container(
                    alignment: pw.Alignment.topLeft,
                    height: 18,
                    child: pw.Text('No',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text('Aspek Stres Akademik',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text('Persentase',
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
                    child: pw.Text('1')),
                pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text('Psikologis')),
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
              ]),
              pw.TableRow(children: [
                pw.Container(
                    alignment: pw.Alignment.topLeft,
                    height: 18,
                    child: pw.Text('2')),
                pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text('Finansial')),
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
              ]),
              pw.TableRow(children: [
                pw.Container(
                    alignment: pw.Alignment.topLeft,
                    height: 18,
                    child: pw.Text('3')),
                pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text('Spriritual')),
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
              ]),
            ]),
          ),
          pw.SizedBox(height: 5),
          pw.Text(
              "Berdasarkan hasil pengisian skala stres akademik ${response!.nama}, diberikan rekomendasi untuk melanjutkan proses tolong diri melalui aplikasi tolong diri konseling realitas untuk mereduksi stres akademik yang ${response!.nama} miliki. ${response!.nama} dapat menghubungi konselor apabila hal-hal yang ingin dikonsultasikan lebih lanjut."),
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
