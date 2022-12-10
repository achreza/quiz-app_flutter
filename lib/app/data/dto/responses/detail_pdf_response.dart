import 'dart:ffi';

class DetailPdfResponse {
  String? nama;
  String? nisn;
  String? sekolah;
  String? email;
  String? usia;
  String? jk;
  String? kelas;
  String? waktu;
  List<dynamic>? persentase;
  String? persentase_total;

  DetailPdfResponse(
      {this.nama,
      this.nisn,
      this.sekolah,
      this.email,
      this.usia,
      this.jk,
      this.kelas,
      this.waktu,
      this.persentase});

  DetailPdfResponse.fromJson(Map<String, dynamic> json) {
    var siswa = json['message']['siswa'];
    var hasil = json['message']['hasil'];
    nama = siswa['nama'];
    nisn = siswa['nisn'];
    email = siswa['email'];
    usia = siswa['usia'];
    jk = siswa['jk'];
    kelas = siswa['kelas'];
    sekolah = siswa['sekolah'];
    waktu = hasil['waktu'];
    persentase = hasil['persentase'];
    persentase_total = hasil['persentase_total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama'] = this.nama;
    data['nisn'] = this.nisn;
    data['email'] = this.email;
    data['usia'] = this.usia;
    data['jk'] = this.jk;
    data['kelas'] = this.kelas;
    data['sekolah'] = this.sekolah;
    data['waktu'] = this.waktu;
    data['persentase'] = this.persentase;
    data['persentase_total'] = this.persentase_total;
    return data;
  }
}
