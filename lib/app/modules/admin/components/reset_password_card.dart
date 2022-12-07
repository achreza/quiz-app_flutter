import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_care_app/app/modules/admin/controllers/admin_controller.dart';

import '../../../data/models/list_siswa.dart';

class ResetPasswordCard extends StatelessWidget {
  final Message data;
  ResetPasswordCard({super.key, required this.data});
  var controller = Get.find<AdminController>();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(data.uname.toString()),
        subtitle: Text(data.email.toString()),
        trailing: IconButton(
          icon: Icon(Icons.lock_reset),
          onPressed: () {
            controller.resetPassword(int.parse(data.id.toString()));
          },
        ),
      ),
    );
  }
}
