import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:self_care_app/app/data/dto/requests/edit_data_siswa_request.dart';
import 'package:self_care_app/app/data/dto/requests/edit_password_siswa_request.dart';
import 'package:self_care_app/app/data/dto/requests/login_request.dart';
import 'package:self_care_app/app/data/dto/responses/detail_pdf_response.dart';
import 'package:self_care_app/app/data/dto/responses/hasil_quiz_response.dart';
import 'package:self_care_app/app/data/models/question.dart';
import 'package:self_care_app/app/data/models/user.dart';
import 'package:self_care_app/app/data/services/login_service.dart';
import 'package:self_care_app/app/data/services/quiz_service.dart';
import 'package:self_care_app/app/data/services/siswa_service.dart';
import 'package:self_care_app/app/modules/welcome/views/hasil_view.dart';
import 'package:self_care_app/app/modules/welcome/views/profil_view.dart';
import 'package:self_care_app/app/modules/welcome/views/welcome_view.dart';
import 'package:self_care_app/app/routes/app_pages.dart';

import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class WelcomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement WelcomeController

  final GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController namaCtr = TextEditingController();
  TextEditingController tglLahirCtr = TextEditingController();
  TextEditingController kelasCtr = TextEditingController();
  TextEditingController sekolahCtr = TextEditingController();
  TextEditingController nisnCtr = TextEditingController();
  TextEditingController jkCtr = TextEditingController();
  TextEditingController passwordLamaCtr = TextEditingController();
  TextEditingController passwordBaruCtr = TextEditingController();
  TextEditingController konfirmasiPasswordCtr = TextEditingController();

  final count = 0.obs;
  RxBool sudahTerisi = false.obs;
  RxBool isLoading = true.obs;

  Message datauser = Get.arguments;
  SiswaService? _siswaService;
  LoginService? _loginService;
  QuizService? _quizService;

  HasilQuizResponse? hasilQuiz;

  List<Question> questions = sample_data
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();

  final RxInt tabIndex = 0.obs;
  late TabController tabController;

  final List<Widget> pages = [WelcomeView(), HasilView(), ProfilView()];

  void changeTab(int index) {
    tabIndex.value = index;
    tabController.animateTo(index);
  }

  void cekTerisi() async {
    var response = await _quizService!.quizTiapSiswa(datauser.id.toString());
    response == true ? sudahTerisi.value = true : sudahTerisi.value = false;
    getHasilQuiz();
  }

  void getHasilQuiz() async {
    HasilQuizResponse? response =
        await _quizService!.respoonseQuizTiapSiswa(datauser.id.toString());
    hasilQuiz = response;
    isLoading.value = false;
  }

  void editPasswordSiswa() async {
    EditPasswordSiswaRequest request = EditPasswordSiswaRequest(
        passwordLama: passwordLamaCtr.text,
        passwordBaru: passwordBaruCtr.text,
        passwordUlang: passwordBaruCtr.text);

    var response = await _siswaService!
        .editPasswordSiswa(datauser.id!.toString(), request);

    Get.defaultDialog(
        middleText: response.toString(),
        textConfirm: 'OK',
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back();
        });
  }

  void postLengkapiData() async {
    EditDataSiswaRequest request = EditDataSiswaRequest(
        kelas: kelasCtr.text,
        sekolah: sekolahCtr.text,
        nisn: int.parse(nisnCtr.text),
        jk: jkCtr.text,
        nama: namaCtr.text,
        tgl_lahir: tglLahirCtr.text);
    var response = await _siswaService!
        .editDataSiswa(int.parse(datauser.id.toString()), request);

    if (response != null) {
      Get.defaultDialog(
          middleText: 'Gagal Update Data',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }

    Get.defaultDialog(
        middleText: 'Berhasil Update Data',
        textConfirm: 'OK',
        confirmTextColor: Colors.white,
        onConfirm: () async {
          final response = await _loginService!.fetchLogin(LoginRequestModel(
              uname: datauser.uname, password: datauser.password));

          if (response != null) {
            Message dataUserBaru = Message.fromJson(response.message!.toJson());
            datauser = dataUserBaru;
            Get.offAndToNamed(Routes.WELCOME, arguments: dataUserBaru);
          }
        });
  }

  void logOut() {
    Get.defaultDialog(
        middleText: 'Anda Telah Logout',
        textConfirm: 'OK',
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.offAllNamed('/login');
        });
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: pages.length, vsync: this);
    _siswaService = Get.put<SiswaService>(SiswaService());
    _loginService = Get.put<LoginService>(LoginService());
    _quizService = Get.put<QuizService>(QuizService());
    cekTerisi();
    // print(sudahTerisi.value);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void editPasswordSheet() {
    Get.bottomSheet(
      Container(
          height: 450,
          padding: EdgeInsets.only(left: 20, right: 20),
          color: Colors.white,
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Silahkan Lengkapi Data Dibawah"),
              SizedBox(height: 8),
              TextFormField(
                style: TextStyle(color: Colors.black),
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                controller: passwordLamaCtr,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Please Enter Old Password'
                      : null;
                },
                decoration: inputDecoration('Password Lama', Icons.lock),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                style: TextStyle(color: Colors.black),
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                controller: passwordBaruCtr,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Please Enter New Password'
                      : null;
                },
                decoration: inputDecoration('Password Baru', Icons.school),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                style: TextStyle(color: Colors.black),
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  return (value == null ||
                          value.isEmpty ||
                          value != passwordBaruCtr.text)
                      ? 'Please Re-Enter password'
                      : null;
                },
                decoration: inputDecoration('Ulangi Password Baru', Icons.lock),
              ),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState?.validate() ?? false) {
                    editPasswordSiswa();
                  }
                  ;
                },
                child: Text('Update Password'),
              ),
            ]),
          )),
      barrierColor: Colors.red[10],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      enableDrag: false,
    );
  }

  void lengkapiData() {
    namaCtr.text = datauser.nama.toString();
    tglLahirCtr.text = datauser.tgl_lahir.toString();
    kelasCtr.text = datauser.kelas.toString();
    sekolahCtr.text = datauser.sekolah.toString();
    nisnCtr.text = datauser.nisn.toString();
    jkCtr.text = datauser.jk.toString().toUpperCase();
    Get.bottomSheet(
      Container(
          height: 1000,
          padding: EdgeInsets.only(left: 20, right: 20),
          color: Colors.white,
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Silahkan Lengkapi Data Dibawah"),
                    SizedBox(height: 8),
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      controller: namaCtr,
                      validator: (value) {
                        return (value == null || value.isEmpty)
                            ? 'Please Enter Nama'
                            : null;
                      },
                      decoration: inputDecoration('Nama', Icons.class_),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      controller: tglLahirCtr,
                      validator: (value) {
                        return (value == null || value.isEmpty)
                            ? 'Please Enter Tanggal Lahir'
                            : null;
                      },
                      decoration:
                          inputDecoration('Tanggal Lahir', Icons.class_),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      controller: kelasCtr,
                      validator: (value) {
                        return (value == null || value.isEmpty)
                            ? 'Please Enter Kelas'
                            : null;
                      },
                      decoration: inputDecoration('Kelas', Icons.class_),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      controller: sekolahCtr,
                      validator: (value) {
                        return (value == null || value.isEmpty)
                            ? 'Please Enter Sekolah'
                            : null;
                      },
                      decoration: inputDecoration('Sekolah', Icons.school),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        return (value == null || value.isEmpty)
                            ? 'Please Enter NISN'
                            : null;
                      },
                      controller: nisnCtr,
                      decoration: inputDecoration('NISN', Icons.numbers),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      controller: jkCtr,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        return (value == null || value.isEmpty)
                            ? 'Please Enter Jenis Kelamin L/P'
                            : null;
                      },
                      decoration:
                          inputDecoration('Jenis Kelamin (L/P)', Icons.person),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState?.validate() ?? false) {
                          postLengkapiData();
                        }
                      },
                      child: Text('Lengkapi Data'),
                    ),
                  ]),
            ),
          )),
      barrierColor: Colors.red[10],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      enableDrag: false,
    );
  }

  void getPdf(String string) async {
    DetailPdfResponse? response =
        await _quizService!.detailPdf(datauser.id.toString());
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
    final file = File('${dir.path}/hasil${datauser.id}.pdf');

    await file.writeAsBytes(bytes);

    await OpenFile.open(file.path);
    // print('tapped');
  }
}

InputDecoration inputDecoration(String labelText, IconData iconData,
    {String? prefix, String? helperText}) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    helperText: helperText,
    labelText: labelText,
    labelStyle: TextStyle(color: Colors.grey),
    fillColor: Colors.white,
    filled: true,
    prefixText: prefix,
    prefixIcon: Icon(
      iconData,
      size: 20,
      color: Colors.black,
    ),
    prefixIconConstraints: BoxConstraints(minWidth: 60),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black)),
  );
}
