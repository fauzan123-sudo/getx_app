// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      message: json['message'] as String?,
      namaWali: json['nama_wali'] as String?,
      siswaWali: (json['siswa_wali'] as List<dynamic>?)
          ?.map((e) => SiswaWali.fromJson(e as Map<String, dynamic>))
          .toList(),
      accessToken: json['access_token'] as String?,
      tokenType: json['token_type'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'message': instance.message,
      'nama_wali': instance.namaWali,
      'siswa_wali': instance.siswaWali,
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
    };

SiswaWali _$SiswaWaliFromJson(Map<String, dynamic> json) => SiswaWali(
      nama: json['nama'] as String?,
      nisn: json['nisn'] as String?,
      foto: json['foto'] as String?,
      kelas: json['kelas'] as String?,
    );

Map<String, dynamic> _$SiswaWaliToJson(SiswaWali instance) => <String, dynamic>{
      'nama': instance.nama,
      'nisn': instance.nisn,
      'foto': instance.foto,
      'kelas': instance.kelas,
    };
