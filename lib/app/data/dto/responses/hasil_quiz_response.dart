class HasilQuizResponse {
  bool? founded;
  Data? data;
  List<Result>? result;

  HasilQuizResponse({this.founded, this.data, this.result});

  HasilQuizResponse.fromJson(Map<String, dynamic> json) {
    founded = json['founded'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['founded'] = this.founded;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? idSiswa;
  String? datecreated;
  String? totalSkor;

  Data({this.id, this.idSiswa, this.datecreated, this.totalSkor});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idSiswa = json['id_siswa'];
    datecreated = json['datecreated'];
    totalSkor = json['total_skor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_siswa'] = this.idSiswa;
    data['datecreated'] = this.datecreated;
    data['total_skor'] = this.totalSkor;
    return data;
  }
}

class Result {
  String? id;
  String? idHasil;
  String? idQuiz;
  String? indexAnswer;

  Result({this.id, this.idHasil, this.idQuiz, this.indexAnswer});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idHasil = json['id_hasil'];
    idQuiz = json['id_quiz'];
    indexAnswer = json['index_answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_hasil'] = this.idHasil;
    data['id_quiz'] = this.idQuiz;
    data['index_answer'] = this.indexAnswer;
    return data;
  }
}
