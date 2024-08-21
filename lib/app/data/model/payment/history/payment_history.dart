import 'package:json_annotation/json_annotation.dart';

part 'payment_history.g.dart';

@JsonSerializable()
class ModelRiwayatPembayaran {
  @JsonKey(name: "status")
  final bool? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<Datum>? data;

  ModelRiwayatPembayaran({
    this.status,
    this.message,
    this.data,
  });

  factory ModelRiwayatPembayaran.fromJson(Map<String, dynamic> json) =>
      _$ModelRiwayatPembayaranFromJson(json);

  Map<String, dynamic> toJson() => _$ModelRiwayatPembayaranToJson(this);

  @override
  String toString() {
    return 'ModelRiwayatPembayaran(status: $status, message: $message, data: $data)';
  }
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "kode_pembayaran")
  final String? kodePembayaran;
  @JsonKey(name: "biaya")
  final String? biaya;
  @JsonKey(name: "total")
  final String? total;
  @JsonKey(name: "tanggal")
  final String? tanggal;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "status_string")
  final String? statusString;
  @JsonKey(name: "detail")
  final List<Detail>? detail;

  Datum({
    this.kodePembayaran,
    this.biaya,
    this.total,
    this.tanggal,
    this.status,
    this.statusString,
    this.detail,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class Detail {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "kode_pembayaran")
  final String? kodePembayaran;
  @JsonKey(name: "item")
  final dynamic item;
  @JsonKey(name: "nominal")
  final String? nominal;
  @JsonKey(name: "biaya")
  final String? biaya;
  @JsonKey(name: "periode")
  final String? periode;
  @JsonKey(name: "tanggal")
  final String? tanggal;

  Detail({
    this.id,
    this.kodePembayaran,
    this.item,
    this.nominal,
    this.biaya,
    this.periode,
    this.tanggal,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);

  Map<String, dynamic> toJson() => _$DetailToJson(this);
}
