import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_care_app/app/routes/app_pages.dart';

import '../../../data/dto/responses/list_pengisi.dart';

class PengisiCard extends StatelessWidget {
  final Message data;

  const PengisiCard({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: GestureDetector(
        onTap: () => Get.toNamed(Routes.PDF, arguments: data),
        child: ListTile(
          title: Text("${data.nisn.toString()}"),
          subtitle: Text(data.email.toString()),
          trailing: Text("Total Skor : ${data.totalSkor.toString()}"),
        ),
      ),
    );
  }
}
