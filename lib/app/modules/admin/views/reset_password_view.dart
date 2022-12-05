import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:self_care_app/app/modules/admin/controllers/admin_controller.dart';

class ResetPasswordView extends GetView<AdminController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ResetPasswordView'),
          centerTitle: true,
        ),
        body: Center(
          child: Obx(() => controller.isLoading.value
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: controller.datas!.message!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                            controller.datas!.message![index].uname.toString()),
                        subtitle: Text(
                            controller.datas!.message![index].email.toString()),
                        trailing: IconButton(
                          icon: Icon(Icons.change_circle),
                          onPressed: () {
                            //
                          },
                        ),
                      ),
                    );
                  })),
        ));
  }
}
