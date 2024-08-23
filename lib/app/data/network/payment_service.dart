import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:getx_app/app/common/constan/url.dart';
import 'package:getx_app/app/data/model/payment/history/payment_history.dart';
import 'package:getx_app/app/data/model/payment/payment_model.dart';
import 'package:getx_app/app/data/provider/error_handle.dart';
import 'package:getx_app/app/data/provider/handle_dio_error.dart';
import 'package:getx_app/app/utils/dio_inteceptor.dart';

class PaymentService {
  final Dio _dio;

  PaymentService()
      : _dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 20))) {
    _dio.interceptors.add(AuthInterceptor());
    _dio.interceptors.add(AwesomeDioInterceptor());
  }

  Future<Either<FailureModel, PaymentModel>> paymentAPi(
      String nisn, String idTagihan) async {
    debugPrint('nisn : $nisn');
    try {
      var response = await _dio.post(
        AppUrl.pembayaran_create,
        data: {
          "nisn": nisn,
          "id_tagihan": idTagihan,
        },
      );
      if (response.statusCode == 200) {
        final data = PaymentModel.fromJson(response.data);
        return Right(data);
      } else {
        debugPrint('Error debug: ${response.statusMessage}');
        throw Exception('Error throw: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      final errorMsg = handleDioError(e);
      final errorModel = FailureModel(
        // statusCode: e.response?.statusCode,
        message: 'error di dio exception$errorMsg',
      );
      debugPrint('Error DioException debug: $e');
      return Left(errorModel);
    } catch (e) {
      final errorModel = FailureModel(message: 'error catch $e');
      debugPrint('Error debug: $errorModel');
      return Left(errorModel);
    }
  }

  Future<Either<FailureModel, ModelRiwayatPembayaran>> paymentHistoryApi(
      String nisn) async {
    debugPrint('nisn : $nisn');
    try {
      final response = await _dio.get(
        AppUrl.pembayaran,
        queryParameters: {
          "nisn": nisn,
        },
      );
      if (response.statusCode == 200) {
        final data = ModelRiwayatPembayaran.fromJson(response.data);
        return Right(data);
      } else {
        debugPrint('Error debug: ${response.statusMessage}');
        throw Exception('Error throw: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      final errorMsg = handleDioError(e);
      final errorModel = FailureModel(
        // statusCode: e.response?.statusCode,
        message: 'error di dio exception$errorMsg',
      );
      debugPrint('Error DioException debug: $e');
      return Left(errorModel);
    } catch (e) {
      final errorModel = FailureModel(message: 'error catch $e');
      debugPrint('Error debug: $errorModel');
      return Left(errorModel);
    }
  }
}
