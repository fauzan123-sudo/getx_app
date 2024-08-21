import 'package:json_annotation/json_annotation.dart';
part 'main_home_response.g.dart';

@JsonSerializable()
class MainHomeResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  Data? data;

  MainHomeResponse({
    this.status,
    this.message,
    this.data,
  });

  factory MainHomeResponse.fromJson(Map<String, dynamic> json) =>
      _$MainHomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MainHomeResponseToJson(this);

  @override
  String toString() {
    return 'MainHomeResponse(status: $status, message: $message, data: $data)';
  }
}

@JsonSerializable()
class Data {
  @JsonKey(name: "nama_instansi")
  String? namaInstansi;
  @JsonKey(name: "alamat")
  String? alamat;
  @JsonKey(name: "sisa_tagihan")
  String? sisaTagihan;
  @JsonKey(name: "sudah_dibayar")
  int? sudahDibayar;
  @JsonKey(name: "total_tagihan")
  int? totalTagihan;
  @JsonKey(name: "riwayat_pembayaran")
  List<RiwayatPembayaran>? riwayatPembayaran;

  Data({
    this.namaInstansi,
    this.alamat,
    this.sisaTagihan,
    this.sudahDibayar,
    this.totalTagihan,
    this.riwayatPembayaran,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  String toString() {
    return 'Data(namaInstansi: $namaInstansi, alamat: $alamat, sisaTagihan: $sisaTagihan, sudahDibayar: $sudahDibayar, totalTagihan: $totalTagihan, riwayatPembayaran: $riwayatPembayaran)';
  }
}

@JsonSerializable()
class RiwayatPembayaran {
  @JsonKey(name: "id_pembayaran")
  int? idPembayaran;
  @JsonKey(name: "kode_pembayaran")
  String? kodePembayaran;
  @JsonKey(name: "biaya")
  String? biaya;
  @JsonKey(name: "total")
  String? total;
  @JsonKey(name: "tanggal")
  String? tanggal;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "status_string")
  String? statusString;
  @JsonKey(name: "detail")
  List<Biaya>? detail;

  RiwayatPembayaran({
    required this.idPembayaran,
    this.kodePembayaran,
    this.biaya,
    this.total,
    this.tanggal,
    this.status,
    this.statusString,
    this.detail,
  });

  factory RiwayatPembayaran.fromJson(Map<String, dynamic> json) =>
      _$RiwayatPembayaranFromJson(json);

  Map<String, dynamic> toJson() => _$RiwayatPembayaranToJson(this);

  @override
  String toString() {
    return 'RiwayatPembayaran(kodePembayaran: $kodePembayaran,id_pembayaran: $idPembayaran, biaya: $biaya, total: $total, tanggal: $tanggal, status: $status, statusString: $statusString, detail: $detail)';
  }
}

@JsonSerializable()
class Biaya {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "kode_pembayaran")
  String? kodePembayaran;
  @JsonKey(name: "nominal")
  String? nominal;
  @JsonKey(name: "biaya")
  String? biaya;

  Biaya({
    this.id,
    this.kodePembayaran,
    this.nominal,
    this.biaya,
  });

  factory Biaya.fromJson(Map<String, dynamic> json) => _$BiayaFromJson(json);

  Map<String, dynamic> toJson() => _$BiayaToJson(this);

  @override
  String toString() {
    return 'Biaya(id: $id, kodePembayaran: $kodePembayaran, nominal: $nominal, biaya: $biaya)';
  }
}
