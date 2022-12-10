import 'dart:ffi';

class SiswaModel {
  String? nama;
  String? nisn;
  String? sekolah;
  String? email;
  String? tgl_lahir;
  String? jk;
  String? kelas;

  SiswaModel(
      {this.nama,
      this.nisn,
      this.sekolah,
      this.email,
      this.tgl_lahir,
      this.jk,
      this.kelas});

  SiswaModel.fromJson(Map<String, dynamic> json) {
    var siswa = json['message'];
    nama = siswa['nama'];
    nisn = siswa['nisn'];
    email = siswa['email'];
    tgl_lahir = siswa['tgl_lahir'];
    jk = siswa['jk'];
    kelas = siswa['kelas'];
    sekolah = siswa['sekolah'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama'] = this.nama;
    data['nisn'] = this.nisn;
    data['email'] = this.email;
    data['tgl_lahir'] = this.tgl_lahir;
    data['jk'] = this.jk;
    data['kelas'] = this.kelas;
    data['sekolah'] = this.sekolah;
    return data;
  }
}
