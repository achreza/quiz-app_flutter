import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:self_care_app/app/modules/welcome/controllers/welcome_controller.dart';

class ProfilView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor:
                  controller.datauser.jk == "L" ? Colors.blue : Colors.pink,
              radius: 30,
              child: Icon(
                Icons.person,
                size: 30,
              ),
            ),
            Text(controller.datauser.uname.toString()),
            Text(controller.datauser.email.toString()),
            Text(controller.datauser.sekolah.toString()),
            Text(controller.datauser.nisn.toString()),
            Text(controller.datauser.kelas.toString()),
            Text(controller.datauser.jk.toString() == "L"
                ? "Laki-Laki"
                : "Perempuan"),
            ElevatedButton(
                onPressed: () => controller.editPasswordSheet(),
                child: Text("Edit Password")),
            ElevatedButton(
                onPressed: () => controller.logOut(), child: Text("Logout")),
          ],
        ),
      ),
    );
  }
}
