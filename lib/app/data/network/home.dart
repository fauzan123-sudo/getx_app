
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:getx_app/app/common/constan/url.dart';
import 'package:getx_app/app/data/model/home/main_home_response.dart';
import 'package:getx_app/app/data/model/payment/payment_model.dart';
import 'package:getx_app/app/data/provider/error_handle.dart';
import 'package:getx_app/app/data/provider/handle_dio_error.dart';
import 'package:getx_app/app/utils/dio_inteceptor.dart';
import 'package:getx_app/app/utils/handle_logout.dart';

class HomeService {
  final Dio _dio;
  final LogoutService logoutService = LogoutService();

  HomeService()
      : _dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 20))) {
    _dio.interceptors.addAll([
      AuthInterceptor(),
      // AwesomeDioInterceptor(),
    ]);
  }

  Future<Either<FailureModel, MainHomeResponse>> mainHomeAPi(
      String nisn, String token) async {
    debugPrint('nisn : $nisn');
    try {
      var response = await _dio.get(
        '${AppUrl.homeUrl}?nisn=$nisn&token_fcm=$token',
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200) {
        try {
          final data = MainHomeResponse.fromJson(response.data);
          return Right(data);
        } catch (parseError) {
          debugPrint('Error parsing response: $parseError');
          return Left(FailureModel(message: 'Error parsing server response'));
        }
      } else {
        return Left(
            FailureModel(message: 'Server returned ${response.statusCode}'));
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        final errorMsg = e.response?.data['message'] ?? 'Unauthorized';
        // await logoutService.logout();
        // Tambahkan logika untuk mengarahkan pengguna ke halaman login
        return Left(FailureModel(message: errorMsg));
      } else {
        final errorMsg = handleDioError(e);
        final errorModel = FailureModel(
          message: 'Network error: $errorMsg',
        );
        debugPrint('Error DioException debug: $e');
        return Left(errorModel);
      }
    }
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
        try {
          final data = PaymentModel.fromJson(response.data);
          return Right(data);
        } catch (parseError) {
          debugPrint('Error parsing response: $parseError');
          return Left(FailureModel(message: 'Error parsing server response'));
        }
      } else {
        return Left(
            FailureModel(message: 'Server returned ${response.statusCode}'));
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        final errorMsg = e.response?.data['message'] ?? 'Unauthorized';
        // await logoutService.logout();
        // Tambahkan logika untuk mengarahkan pengguna ke halaman login
        return Left(FailureModel(message: errorMsg));
      } else {
        final errorMsg = handleDioError(e);
        final errorModel = FailureModel(
          // statusCode: e.response?.statusCode,
          message: 'error di dio exception$errorMsg',
        );
        debugPrint('Error DioException debug: $e');
        return Left(errorModel);
      }
    } catch (e) {
      final errorModel = FailureModel(message: 'error catch $e');
      debugPrint('Error debug: $errorModel');
      return Left(errorModel);
    }
  }
}

