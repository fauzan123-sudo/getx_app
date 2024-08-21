import 'package:json_annotation/json_annotation.dart';

part 'payment_model.g.dart';

@JsonSerializable()
class PaymentModel {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  PaymentData? data;

  PaymentModel({
    this.status,
    this.message,
    this.data,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentModelToJson(this);

  @override
  String toString() {
    return 'PaymentModel(status: $status, message: $message, data:$data)';
  }
}

@JsonSerializable()
class PaymentData {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data_pembayaran")
  PaymentDetails? dataPembayaran;

  PaymentData({
    this.message,
    this.dataPembayaran,
  });

  factory PaymentData.fromJson(Map<String, dynamic> json) =>
      _$PaymentDataFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentDataToJson(this);

  @override
  String toString() {
    return 'PaymentData(message: $message, dataPembayaran: $dataPembayaran)';
  }
}

@JsonSerializable()
class PaymentDetails {
  @JsonKey(name: "no_va")
  String? noVa;
  @JsonKey(name: "amount")
  int? amount;
  @JsonKey(name: "expired")
  String? expired;

  PaymentDetails({
    this.noVa,
    this.amount,
    this.expired,
  });

  factory PaymentDetails.fromJson(Map<String, dynamic> json) =>
      _$PaymentDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentDetailsToJson(this);

  @override
  String toString() {
    return 'PaymentDetails(noVa: $noVa, amount: $amount, expired: $expired)';
  }
}
