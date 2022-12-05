import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:self_care_app/app/modules/admin/controllers/admin_controller.dart';

class PengisiView extends GetView<AdminController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PengisiView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PengisiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}