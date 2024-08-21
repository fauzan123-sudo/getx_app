import 'package:json_annotation/json_annotation.dart';

part 'model_tagihan.g.dart';

@JsonSerializable()
class TagihanResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  List<DataTagihan>? data;

  TagihanResponse({
    this.status,
    this.message,
    this.data,
  });

  factory TagihanResponse.fromJson(Map<String, dynamic> json) =>
      _$TagihanResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TagihanResponseToJson(this);

  @override
  String toString() {
    return 'TagihanResponse(status: $status, message: $message, data: $data)';
  }
}

@JsonSerializable()
class DataTagihan {
  @JsonKey(name: "periode")
  String? periode;
  @JsonKey(name: "list")
  List<ListTagihan>? list;

  DataTagihan({
    this.periode,
    this.list,
  });

  factory DataTagihan.fromJson(Map<String, dynamic> json) =>
      _$DataTagihanFromJson(json);

  Map<String, dynamic> toJson() => _$DataTagihanToJson(this);

  @override
  String toString() {
    return 'DataTagihan(periode: $periode, list: $list)';
  }
}

@JsonSerializable()
class ListTagihan {
  @JsonKey(name: "tagihan_id")
  String? tagihanId;
  @JsonKey(name: "nominal")
  String? nominal;
  @JsonKey(name: "nama_biaya")
  String? namaBiaya;
  @JsonKey(name: "tanggal_jatuh_tempo")
  String? tanggalJatuhTempo;
  @JsonKey(name: "nominal_real")
  int? nominalReal;

  ListTagihan({
    this.tagihanId,
    this.nominal,
    this.namaBiaya,
    this.tanggalJatuhTempo,
    this.nominalReal,
  });

  factory ListTagihan.fromJson(Map<String, dynamic> json) =>
      _$ListTagihanFromJson(json);

  Map<String, dynamic> toJson() => _$ListTagihanToJson(this);

  @override
  String toString() {
    return 'ListTagihan(tagihanId: $tagihanId, nominal: $nominal, namaBiaya: $namaBiaya, tanggalJatuhTempo: $tanggalJatuhTempo, nominalReal: $nominalReal)';
  }
}
