// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainHomeResponse _$MainHomeResponseFromJson(Map<String, dynamic> json) =>
    MainHomeResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MainHomeResponseToJson(MainHomeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      namaInstansi: json['nama_instansi'] as String?,
      alamat: json['alamat'] as String?,
      sisaTagihan: json['sisa_tagihan'] as String?,
      sudahDibayar: json['sudah_dibayar'] as String?,
      totalTagihan: json['total_tagihan'] as String?,
      riwayatPembayaran: (json['riwayat_pembayaran'] as List<dynamic>?)
          ?.map((e) => RiwayatPembayaran.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'nama_instansi': instance.namaInstansi,
      'alamat': instance.alamat,
      'sisa_tagihan': instance.sisaTagihan,
      'sudah_dibayar': instance.sudahDibayar,
      'total_tagihan': instance.totalTagihan,
      'riwayat_pembayaran': instance.riwayatPembayaran,
    };

RiwayatPembayaran _$RiwayatPembayaranFromJson(Map<String, dynamic> json) =>
    RiwayatPembayaran(
      kodePembayaran: json['kode_pembayaran'] as String?,
      biaya: json['biaya'] as String?,
      total: json['total'] as String?,
      tanggal: json['tanggal'] as String?,
      jam: json['jam'] as String?,
      status: (json['status'] as num?)?.toInt(),
      statusString: json['status_string'] as String?,
      detail: (json['detail'] as List<dynamic>?)
          ?.map((e) => Biaya.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RiwayatPembayaranToJson(RiwayatPembayaran instance) =>
    <String, dynamic>{
      'kode_pembayaran': instance.kodePembayaran,
      'biaya': instance.biaya,
      'total': instance.total,
      'tanggal': instance.tanggal,
      'jam': instance.jam,
      'status': instance.status,
      'status_string': instance.statusString,
      'detail': instance.detail,
    };

Biaya _$BiayaFromJson(Map<String, dynamic> json) => Biaya(
      id: (json['id'] as num?)?.toInt(),
      kodePembayaran: json['kode_pembayaran'] as String?,
      item: json['item'] as String?,
      nominal: json['nominal'] as String?,
      biaya: json['biaya'] as String?,
      periode: json['periode'] as String?,
      tanggal: json['tanggal'] as String?,
    );

Map<String, dynamic> _$BiayaToJson(Biaya instance) => <String, dynamic>{
      'id': instance.id,
      'kode_pembayaran': instance.kodePembayaran,
      'item': instance.item,
      'nominal': instance.nominal,
      'biaya': instance.biaya,
      'periode': instance.periode,
      'tanggal': instance.tanggal,
    };
