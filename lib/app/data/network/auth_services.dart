import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:getx_app/app/common/constan/url.dart';
import 'package:getx_app/app/data/model/auth/login_response.dart';
import 'package:getx_app/app/data/provider/error_handle.dart';
import 'package:getx_app/app/data/provider/handle_dio_error.dart';

class AuthService {
  final Dio _dio;

  AuthService()
      : _dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 20))) {
    _dio.interceptors.add(AwesomeDioInterceptor());
  }
  Future<Either<FailureModel, LoginResponse>> login(
      String username, String password) async {
    try {
      var response = await _dio.post(
        AppUrl.loginUrl,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "username": username,
          "password": password,
        },
      );

      debugPrint(
          'urlnya : ${AppUrl.loginUrl} username : $username password nya : $password');

      if (response.statusCode == 200) {
        final data = LoginResponse.fromJson(response.data);
        debugPrint('$data');
        return Right(data);
      } else {
        debugPrint('Error: ${response.statusMessage}');
        throw Exception('Error: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      final errorMsg = handleDioError(e);
      final errorModel = FailureModel(
        // statusCode: e.response?.statusCode,
        message: errorMsg,
      );
      return Left(errorModel);
    } catch (e) {
      final errorModel = FailureModel(message: e.toString());
      return Left(errorModel);
    }
  }
}
