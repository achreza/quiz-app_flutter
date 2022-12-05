class ListSiswaModel {
  bool? status;
  List<Message>? message;

  ListSiswaModel({this.status, this.message});

  ListSiswaModel.fromJson(Map<String, dynamic> json) {
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

  Message({this.id, this.uname, this.password, this.email, this.nisn, this.jk});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uname = json['uname'];
    password = json['password'];
    email = json['email'];
    nisn = json['nisn'];
    jk = json['jk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uname'] = this.uname;
    data['password'] = this.password;
    data['email'] = this.email;
    data['nisn'] = this.nisn;
    data['jk'] = this.jk;
    return data;
  }
}
