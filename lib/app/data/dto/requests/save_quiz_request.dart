class SaveQuizRequestModel {
  int? idSiswa;
  int? totalSkor;
  String? jawaban;

  SaveQuizRequestModel({this.idSiswa, this.totalSkor, this.jawaban});

  SaveQuizRequestModel.fromJson(Map<String, dynamic> json) {
    idSiswa = json['id_siswa'];
    totalSkor = json['total_skor'];
    jawaban = json['jawaban'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_siswa'] = this.idSiswa;
    data['total_skor'] = this.totalSkor;
    data['jawaban'] = this.jawaban;
    return data;
  }
}
