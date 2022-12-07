import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_care_app/app/data/dto/requests/edit_data_siswa_request.dart';
import 'package:self_care_app/app/data/dto/requests/edit_password_siswa_request.dart';
import 'package:self_care_app/app/data/dto/requests/login_request.dart';
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

class WelcomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement WelcomeController

  final GlobalKey<FormState> formKey = GlobalKey();

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
        jk: jkCtr.text);
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
    print(sudahTerisi.value);
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
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                controller: passwordLamaCtr,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Please Enter Old Password'
                      : null;
                },
                decoration: inputDecoration('Old Password', Icons.lock),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                controller: passwordBaruCtr,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Please Enter New Password'
                      : null;
                },
                decoration: inputDecoration('New Password', Icons.school),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  return (value == null ||
                          value.isEmpty ||
                          value != passwordBaruCtr.text)
                      ? 'Please Re-Enter password'
                      : null;
                },
                decoration: inputDecoration('Re-Enter Password', Icons.lock),
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
          )),
      barrierColor: Colors.red[10],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      enableDrag: false,
    );
  }
}

InputDecoration inputDecoration(String labelText, IconData iconData,
    {String? prefix, String? helperText}) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    helperText: helperText,
    labelText: labelText,
    labelStyle: TextStyle(color: Colors.grey),
    fillColor: Colors.grey.shade200,
    filled: true,
    prefixText: prefix,
    prefixIcon: Icon(
      iconData,
      size: 20,
    ),
    prefixIconConstraints: BoxConstraints(minWidth: 60),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.black)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.black)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.black)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.black)),
  );
}
