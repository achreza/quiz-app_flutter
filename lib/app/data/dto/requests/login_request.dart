class LoginRequestModel {
  String? uname;
  String? password;

  LoginRequestModel({this.uname, this.password});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    uname = json['uname'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uname'] = this.uname;
    data['password'] = this.password;
    return data;
  }
}
