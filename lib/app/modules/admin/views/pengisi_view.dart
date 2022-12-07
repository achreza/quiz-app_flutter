import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:self_care_app/app/data/dto/responses/list_pengisi.dart';
import 'package:self_care_app/app/modules/admin/components/pengisi_card.dart';
import 'package:self_care_app/app/modules/admin/controllers/admin_controller.dart';

class PengisiView extends GetView<AdminController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Obx(() => controller.isLoading.value
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: controller.pengisiDatas!.message!.length,
              itemBuilder: (context, index) {
                return PengisiCard(
                    data: controller.pengisiDatas!.message![index]);
              })),
    ));
  }
}
