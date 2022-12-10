import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:self_care_app/app/modules/welcome/controllers/welcome_controller.dart';

class ProfilView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                  child: Text('PROFIL',
                      style: TextStyle(
                          fontSize: 24,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w800))),
              SizedBox(height: 10),
              Container(
                  width: 300,
                  height: 50,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("Nama : ${controller.datauser.nama.toString()}",
                      style: TextStyle(color: Colors.black))),
              SizedBox(
                height: 5,
              ),
              Container(
                  width: 300,
                  height: 50,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                      "Tanggal Lahir : ${controller.datauser.tgl_lahir.toString()}",
                      style: TextStyle(color: Colors.black))),
              SizedBox(
                height: 5,
              ),
              Container(
                  width: 300,
                  height: 50,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("Email : ${controller.datauser.email.toString()}",
                      style: TextStyle(color: Colors.black))),
              SizedBox(
                height: 5,
              ),
              Container(
                  width: 300,
                  height: 50,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                      "Sekolah : ${controller.datauser.sekolah.toString()}",
                      style: TextStyle(color: Colors.black))),
              SizedBox(
                height: 5,
              ),
              Container(
                  width: 300,
                  height: 50,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("NISN : ${controller.datauser.nisn.toString()}",
                      style: TextStyle(color: Colors.black))),
              SizedBox(
                height: 5,
              ),
              Container(
                  width: 300,
                  height: 50,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("Kelas : ${controller.datauser.kelas.toString()}",
                      style: TextStyle(color: Colors.black))),
              SizedBox(
                height: 5,
              ),
              Container(
                  width: 300,
                  height: 50,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                      controller.datauser.jk.toString() == "L"
                          ? "Jenis Kelamin : Laki-Laki"
                          : "Jenis Kelamin :Perempuan",
                      style: TextStyle(color: Colors.black))),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                  onPressed: () => controller.lengkapiData(),
                  child: Text("Edit Data")),
              ElevatedButton(
                  onPressed: () => controller.editPasswordSheet(),
                  child: Text("Edit Password")),
              ElevatedButton(
                  onPressed: () => controller.logOut(), child: Text("Logout")),
            ],
          ),
        ),
      ),
    );
  }
}
