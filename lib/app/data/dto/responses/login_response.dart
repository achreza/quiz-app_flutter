class LoginResponseModel {
  bool? status;
  Message? message;

  LoginResponseModel({this.status, this.message});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message =
        json['message'] != null ? new Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    return data;
  }
}

class Message {
  String? id;
  String? uname;
  String? password;
  String? email;
  String? nisn;
  String? jk;
  String? kelas;
  String? sekolah;
  String? nama;
  String? tgl_lahir;

  Message(
      {this.id,
      this.uname,
      this.password,
      this.email,
      this.nisn,
      this.jk,
      this.kelas,
      this.sekolah,
      this.nama,
      this.tgl_lahir});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uname = json['uname'];
    password = json['password'];
    email = json['email'];
    nisn = json['nisn'];
    jk = json['jk'];
    kelas = json['kelas'];
    sekolah = json['sekolah'];
    nama = json['nama'];
    tgl_lahir = json['tgl_lahir'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uname'] = this.uname;
    data['password'] = this.password;
    data['email'] = this.email;
    data['nisn'] = this.nisn;
    data['jk'] = this.jk;
    data['kelas'] = this.kelas;
    data['sekolah'] = this.sekolah;
    data['nama'] = this.nama;
    data['tgl_lahir'] = this.tgl_lahir;
    return data;
  }
}
