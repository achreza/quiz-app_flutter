class ListPengisiModel {
  bool? status;
  List<Message>? message;

  ListPengisiModel({this.status, this.message});

  ListPengisiModel.fromJson(Map<String, dynamic> json) {
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
  String? idSiswa;
  String? datecreated;
  String? totalSkor;
  String? email;
  Null? nisn;
  Null? jk;

  Message(
      {this.id,
      this.idSiswa,
      this.datecreated,
      this.totalSkor,
      this.email,
      this.nisn,
      this.jk});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idSiswa = json['id_siswa'];
    datecreated = json['datecreated'];
    totalSkor = json['total_skor'];
    email = json['email'];
    nisn = json['nisn'];
    jk = json['jk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_siswa'] = this.idSiswa;
    data['datecreated'] = this.datecreated;
    data['total_skor'] = this.totalSkor;
    data['email'] = this.email;
    data['nisn'] = this.nisn;
    data['jk'] = this.jk;
    return data;
  }
}
