import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:self_care_app/app/modules/question/views/question_view.dart';
import 'package:self_care_app/app/routes/app_pages.dart';
import 'package:self_care_app/constant.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/icons/bg.svg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Obx(
            () => controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : SafeArea(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(flex: 2), //2/6
                          Text(
                            "Inventori Kesiapan Pranikah Siswa SMA",
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),

                          Spacer(), // 1/6

                          InkWell(
                            onTap: () => controller.sudahTerisi.value
                                ? controller.tabIndex.value == 1
                                : controller.datauser.nisn == null
                                    ? controller.lengkapiData()
                                    : Get.offAndToNamed(Routes.QUESTION,
                                        arguments: controller.datauser),
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding:
                                  EdgeInsets.all(kDefaultPadding * 0.75), // 15
                              decoration: BoxDecoration(
                                gradient: kPrimaryGradient,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Text(
                                controller.sudahTerisi.value == true
                                    ? "Anda Sudah Mengisi Quiz, Lihat Hasil Anda"
                                    : controller.datauser.nisn == null
                                        ? "Silahkan isi data diri terlebih dahulu"
                                        : "Mulai Quiz",
                                style: Theme.of(context)
                                    .textTheme
                                    .button!
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                          ),
                          Spacer(flex: 2), // it will take 2/6 spaces
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
