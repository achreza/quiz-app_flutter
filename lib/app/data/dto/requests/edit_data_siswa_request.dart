class EditDataSiswaRequest {
  String? kelas;
  String? sekolah;
  int? nisn;
  String? jk;

  EditDataSiswaRequest({this.kelas, this.sekolah, this.nisn, this.jk});

  EditDataSiswaRequest.fromJson(Map<String, dynamic> json) {
    kelas = json['kelas'];
    sekolah = json['sekolah'];
    nisn = json['nisn'];
    jk = json['jk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kelas'] = this.kelas;
    data['sekolah'] = this.sekolah;
    data['nisn'] = this.nisn;
    data['jk'] = this.jk;
    return data;
  }
}
