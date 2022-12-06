import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_care_app/app/data/models/list_siswa.dart';
import 'package:self_care_app/app/data/services/siswa_service.dart';
import 'package:self_care_app/app/modules/admin/views/pengisi_view.dart';
import 'package:self_care_app/app/modules/admin/views/reset_password_view.dart';

class AdminController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement AdminController

  final count = 0.obs;

  var isLoading = true.obs;

  ListSiswaModel? datas;

  SiswaService? _siswaService;

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
      datas = response;
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

  void fetchAllData() async {
    await getAllSiswa();
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: pages.length, vsync: this);
    _siswaService = Get.put(SiswaService());
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
