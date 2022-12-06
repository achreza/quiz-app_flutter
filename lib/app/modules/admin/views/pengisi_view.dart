import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
                return Card(
                  child: ListTile(
                    title: Text(controller.pengisiDatas!.message![index].idSiswa
                        .toString()),
                    subtitle: Text(controller
                        .pengisiDatas!.message![index].email
                        .toString()),
                    trailing: Text(
                        "Total Skor : ${controller.pengisiDatas!.message![index].totalSkor.toString()}"),
                  ),
                );
              })),
    ));
  }
}
