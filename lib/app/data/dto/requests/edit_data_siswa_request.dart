class EditDataSiswaRequest {
  String? kelas;
  String? sekolah;
  int? nisn;
  String? jk;
  String? nama;
  String? tgl_lahir;

  EditDataSiswaRequest(
      {this.kelas,
      this.sekolah,
      this.nisn,
      this.jk,
      this.nama,
      this.tgl_lahir});

  EditDataSiswaRequest.fromJson(Map<String, dynamic> json) {
    kelas = json['kelas'];
    sekolah = json['sekolah'];
    nisn = json['nisn'];
    jk = json['jk'];
    nama = json['nama'];
    tgl_lahir = json['tgl_lahir'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kelas'] = this.kelas;
    data['sekolah'] = this.sekolah;
    data['nisn'] = this.nisn;
    data['jk'] = this.jk;
    data['nama'] = this.nama;
    data['tgl_lahir'] = this.tgl_lahir;
    return data;
  }
}
