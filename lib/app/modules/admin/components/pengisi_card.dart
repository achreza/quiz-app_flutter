import 'package:flutter/material.dart';

import '../../../data/dto/responses/list_pengisi.dart';

class PengisiCard extends StatelessWidget {
  final Message data;

  const PengisiCard({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        title: Text("${data.nisn.toString()}"),
        subtitle: Text(data.email.toString()),
        trailing: Text("Total Skor : ${data.totalSkor.toString()}"),
      ),
    );
  }
}
