// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelRiwayatPembayaran _$ModelRiwayatPembayaranFromJson(
        Map<String, dynamic> json) =>
    ModelRiwayatPembayaran(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ModelRiwayatPembayaranToJson(
        ModelRiwayatPembayaran instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      kodePembayaran: json['kode_pembayaran'] as String?,
      biaya: json['biaya'] as String?,
      total: json['total'] as String?,
      tanggal: json['tanggal'] as String?,
      status: json['status'] as int?,
      statusString: json['status_string'] as String?,
      detail: (json['detail'] as List<dynamic>?)
          ?.map((e) => Detail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'kode_pembayaran': instance.kodePembayaran,
      'biaya': instance.biaya,
      'total': instance.total,
      'tanggal': instance.tanggal,
      'status': instance.status,
      'status_string': instance.statusString,
      'detail': instance.detail,
    };

Detail _$DetailFromJson(Map<String, dynamic> json) => Detail(
      id: json['id'] as int?,
      kodePembayaran: json['kode_pembayaran'] as String?,
      item: json['item'],
      nominal: json['nominal'] as String?,
      biaya: json['biaya'] as String?,
      periode: json['periode'] as String?,
      tanggal: json['tanggal'] as String?,
    );

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      'id': instance.id,
      'kode_pembayaran': instance.kodePembayaran,
      'item': instance.item,
      'nominal': instance.nominal,
      'biaya': instance.biaya,
      'periode': instance.periode,
      'tanggal': instance.tanggal,
    };
