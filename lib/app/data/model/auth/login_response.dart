import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  Data? data;

  LoginResponse({
    this.status,
    this.message,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  @override
  String toString() {
    return 'LoginResponse(status: $status, message: $message, data: $data)';
  }
}

@JsonSerializable()
class Data {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "nama_wali")
  String? namaWali;
  @JsonKey(name: "siswa_wali")
  List<SiswaWali>? siswaWali;
  @JsonKey(name: "access_token")
  String? accessToken;
  @JsonKey(name: "token_type")
  String? tokenType;

  Data({
    this.message,
    this.namaWali,
    this.siswaWali,
    this.accessToken,
    this.tokenType,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  String toString() {
    return 'Data(message: $message, namaWali: $namaWali, siswaWali: $siswaWali, accessToken: $accessToken, tokenType: $tokenType)';
  }
}

@JsonSerializable()
class SiswaWali {
  @JsonKey(name: "nama")
  String? nama;
  @JsonKey(name: "nisn")
  String? nisn;
  @JsonKey(name: "foto")
  String? foto;
  @JsonKey(name: "kelas")
  String? kelas;

  SiswaWali({
    this.nama,
    this.nisn,
    this.foto,
    this.kelas,
  });

  factory SiswaWali.fromJson(Map<String, dynamic> json) =>
      _$SiswaWaliFromJson(json);

  Map<String, dynamic> toJson() => _$SiswaWaliToJson(this);

  @override
  String toString() {
    return 'SiswaWali(nama: $nama, nisn: $nisn, foto: $foto, kelas: $kelas)';
  }
}
