// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_tagihan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagihanResponse _$TagihanResponseFromJson(Map<String, dynamic> json) =>
    TagihanResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataTagihan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TagihanResponseToJson(TagihanResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

DataTagihan _$DataTagihanFromJson(Map<String, dynamic> json) => DataTagihan(
      periode: json['periode'] as String?,
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => ListTagihan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataTagihanToJson(DataTagihan instance) =>
    <String, dynamic>{
      'periode': instance.periode,
      'list': instance.list,
    };

ListTagihan _$ListTagihanFromJson(Map<String, dynamic> json) => ListTagihan(
      tagihanId: json['tagihan_id'] as String?,
      nominal: json['nominal'] as String?,
      namaBiaya: json['nama_biaya'] as String?,
      tanggalJatuhTempo: json['tanggal_jatuh_tempo'] as String?,
      nominalReal: json['nominal_real'] as int?,
    );

Map<String, dynamic> _$ListTagihanToJson(ListTagihan instance) =>
    <String, dynamic>{
      'tagihan_id': instance.tagihanId,
      'nominal': instance.nominal,
      'nama_biaya': instance.namaBiaya,
      'tanggal_jatuh_tempo': instance.tanggalJatuhTempo,
      'nominal_real': instance.nominalReal,
    };
