// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) => PaymentModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : PaymentData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentModelToJson(PaymentModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

PaymentData _$PaymentDataFromJson(Map<String, dynamic> json) => PaymentData(
      message: json['message'] as String?,
      dataPembayaran: json['data_pembayaran'] == null
          ? null
          : PaymentDetails.fromJson(
              json['data_pembayaran'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentDataToJson(PaymentData instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data_pembayaran': instance.dataPembayaran,
    };

PaymentDetails _$PaymentDetailsFromJson(Map<String, dynamic> json) =>
    PaymentDetails(
      noVa: json['no_va'] as String?,
      amount: json['amount'] as String?,
      expired: json['expired'] as String?,
    );

Map<String, dynamic> _$PaymentDetailsToJson(PaymentDetails instance) =>
    <String, dynamic>{
      'no_va': instance.noVa,
      'amount': instance.amount,
      'expired': instance.expired,
    };
