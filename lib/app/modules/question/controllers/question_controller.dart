import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:self_care_app/app/data/dto/requests/save_quiz_request.dart';
import 'package:self_care_app/app/data/dto/responses/detail_pdf_response.dart';
import 'package:self_care_app/app/data/dto/responses/hasil_quiz_response.dart';
import 'package:self_care_app/app/data/models/user.dart';
import 'package:self_care_app/app/data/models/question.dart';
import 'package:self_care_app/app/data/services/login_service.dart';
import 'package:self_care_app/app/data/services/quiz_service.dart';
import 'package:self_care_app/app/data/services/siswa_service.dart';
import 'package:self_care_app/app/modules/welcome/views/hasil_view.dart';
import 'package:self_care_app/app/routes/app_pages.dart';

import '../views/score_screen.dart';

import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  // Lets animated our progress bar

  AnimationController? _animationController;
  Animation? _animation;

  // so that we can access our animation outside
  Animation? get animation => this._animation;
  Message? datauser = Get.arguments;

  RxBool sudahTerisi = false.obs;
  RxBool isLoading = true.obs;

  PageController? _pageController;
  PageController? get pageController => this._pageController;

  SiswaService? _siswaService;
  LoginService? _loginService;
  QuizService? _quizService;

  HasilQuizResponse? hasilQuiz;

  List<int> kumpulanJawaban = [];

  List<Question> _questions = sample_data
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();
  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int? _correctAns;
  int? get correctAns => this._correctAns;

  int? _selectedAns;
  int? get selectedAns => this._selectedAns;

  // for more about obs please check documentation
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  RxInt totalPoint = 0.obs;
  int get numOfCorrectAns => this._numOfCorrectAns;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    _quizService = Get.put<QuizService>(QuizService());
    // _animationController =
    //     AnimationController(duration: Duration(seconds: 60), vsync: this);
    // _animation = Tween<double>(begin: 0, end: 1).animate(_animationController!)
    //   ..addListener(() {
    //     // update like setState
    //     update();
    //   });

    // start our animation
    // Once 60s is completed go to the next qn
    // _animationController!.forward().whenComplete(nextQuestion);
    _pageController = PageController();

    cekTerisi();
    super.onInit();
  }

  void cekTerisi() async {
    var response = await _quizService!.quizTiapSiswa(datauser!.id.toString());
    response == true ? sudahTerisi.value = true : sudahTerisi.value = false;
    getHasilQuiz();
  }

  void getHasilQuiz() async {
    HasilQuizResponse? response =
        await _quizService!.respoonseQuizTiapSiswa(datauser!.id.toString());
    hasilQuiz = response;
    isLoading.value = false;
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
    // _animationController!.dispose();
    _pageController!.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    // print(_questionNumber);

    if (selectedIndex == 0) {
      totalPoint.value += 4;
    } else if (selectedIndex == 1) {
      totalPoint.value += 3;
    } else if (selectedIndex == 2) {
      totalPoint.value += 2;
    } else if (selectedIndex == 3) {
      totalPoint.value += 1;
    }

    _isAnswered = true;

    _correctAns = selectedIndex;

    //nambah tiap jawaban
    kumpulanJawaban.add(selectedIndex);
    // It will stop the counter
    // _animationController!.stop();

    print("${totalPoint.value} Jawaban : $selectedIndex");

    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(Duration(milliseconds: 500), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController!
          .nextPage(duration: Duration(milliseconds: 250), curve: Curves.ease);
    } else {
      // Get package provide us simple way to naviigate another page
      saveQuiz();

      sudahTerisi.value = true;

      Get.offAllNamed(Routes.WELCOME, arguments: datauser);
    }
  }

  Future<void> saveQuiz() async {
    var model = SaveQuizRequestModel(
      idSiswa: int.parse(datauser!.id!),
      jawaban: kumpulanJawaban.toString(),
      totalSkor: totalPoint.value,
    );
    print(model.toJson());
    final response = await _quizService!.saveQuiz(model);
    print(response);

    if (response != null) {
      Get.defaultDialog(
          middleText: 'Data Berhasil Disimpan',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });

      // Get.offAndToNamed(Routes.WELCOME, arguments: datauser);
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'Data gagal disimpan',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
    // _pageController!.dispose();
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }

  void getPdf() async {
    DetailPdfResponse? response =
        await _quizService!.detailPdf(datauser!.id.toString());
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
    final file = File('${dir.path}/hasil${datauser!.id}.pdf');

    await file.writeAsBytes(bytes);

    await OpenFile.open(file.path);
    // print('tapped');
  }
}
