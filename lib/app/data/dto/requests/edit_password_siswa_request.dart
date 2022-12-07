class EditPasswordSiswaRequest {
  String? passwordLama;
  String? passwordBaru;
  String? passwordUlang;

  EditPasswordSiswaRequest(
      {this.passwordLama, this.passwordBaru, this.passwordUlang});

  EditPasswordSiswaRequest.fromJson(Map<String, dynamic> json) {
    passwordLama = json['password_lama'];
    passwordBaru = json['password_baru'];
    passwordUlang = json['password_ulang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password_lama'] = this.passwordLama;
    data['password_baru'] = this.passwordBaru;
    data['password_ulang'] = this.passwordUlang;
    return data;
  }
}
