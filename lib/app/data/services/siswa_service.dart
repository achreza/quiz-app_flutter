import 'dart:io';

import 'package:get/get.dart';
import 'package:self_care_app/app/data/models/list_siswa.dart';
import 'package:self_care_app/constant.dart';

class SiswaService extends GetConnect {
  final String allSiswa = '${apiBaseUrl}listSiswa';

  Future<ListSiswaModel?> getAllData() async {
    final response = await get(allSiswa);

    if (response.statusCode == HttpStatus.ok) {
      return ListSiswaModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
