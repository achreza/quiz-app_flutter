import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_care_app/app/data/dto/responses/list_pengisi.dart';
import 'package:self_care_app/app/data/models/list_siswa.dart';
import 'package:self_care_app/app/data/services/quiz_service.dart';
import 'package:self_care_app/app/data/services/siswa_service.dart';
import 'package:self_care_app/app/modules/admin/views/pengisi_view.dart';
import 'package:self_care_app/app/modules/admin/views/reset_password_view.dart';

class AdminController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement AdminController

  final count = 0.obs;

  var isLoading = true.obs;

  ListSiswaModel? siswaDatas;
  ListPengisiModel? pengisiDatas;

  SiswaService? _siswaService;
  QuizService? _quizService;

  final RxInt tabIndex = 0.obs;
  late TabController tabController;

  final List<Widget> pages = [
    PengisiView(),
    ResetPasswordView(),
  ];

  void changeTab(int index) {
    tabIndex.value = index;
    tabController.animateTo(index);
  }

  void logOut() {
    Get.defaultDialog(
        middleText: 'Anda Telah Logout dari Admin',
        textConfirm: 'OK',
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.offAllNamed('/login');
        });
  }

  Future<void> getAllSiswa() async {
    ListSiswaModel? response = await _siswaService!.getAllData();

    if (response != null) {
      siswaDatas = response;
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'Siswa not found!',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
    isLoading.value = false;
  }

  Future<void> getAllPengisi() async {
    ListPengisiModel? response = await _quizService!.getAllPengisi();

    if (response != null) {
      pengisiDatas = response;
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'Pengisi not found!',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
    isLoading.value = false;
  }

  void fetchAllData() async {
    await getAllPengisi();
    await getAllSiswa();
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: pages.length, vsync: this);
    _siswaService = Get.put(SiswaService());
    _quizService = Get.put(QuizService());
    fetchAllData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
