class UserModel {
  bool? status;
  List<Message>? message;

  UserModel({this.status, this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['message'] != null) {
      message = <Message>[];
      json['message'].forEach((v) {
        message!.add(new Message.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.message != null) {
      data['message'] = this.message!.map((v) => v.toJson()).toList();
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

  Message(
      {this.id,
      this.uname,
      this.password,
      this.email,
      this.nisn,
      this.jk,
      this.kelas,
      this.sekolah});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uname = json['uname'];
    password = json['password'];
    email = json['email'];
    nisn = json['nisn'];
    jk = json['jk'];
    kelas = json['kelas'];
    sekolah = json['sekolah'];
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
    return data;
  }
}
