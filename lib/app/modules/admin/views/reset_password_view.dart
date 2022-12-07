import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:self_care_app/app/modules/admin/components/reset_password_card.dart';
import 'package:self_care_app/app/modules/admin/controllers/admin_controller.dart';

import '../../../data/models/list_siswa.dart';

class ResetPasswordView extends GetView<AdminController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Obx(() => controller.isLoading.value
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: controller.siswaDatas!.message!.length,
              itemBuilder: (context, index) {
                return ResetPasswordCard(
                    data: controller.siswaDatas!.message![index]);
              })),
    ));
  }
}
