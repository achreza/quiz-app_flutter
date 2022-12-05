class RegisterRequestModel {
  String? uname;
  String? password;
  String? email;

  RegisterRequestModel({this.uname, this.password, this.email});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    uname = json['uname'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uname'] = this.uname;
    data['password'] = this.password;
    data['email'] = this.email;
    return data;
  }
}
