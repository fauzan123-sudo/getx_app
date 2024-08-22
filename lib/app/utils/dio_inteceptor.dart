import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:getx_app/app/data/local/storage_db.dart';
import 'package:getx_app/app/data/model/auth/login_response.dart';
import 'package:getx_app/app/utils/handle_logout.dart';


class AuthInterceptor extends Interceptor {
  final StorageDB _storageDB = StorageDB();
  final LogoutService logoutService = LogoutService();
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      LoginResponse? loginResponse = await _storageDB.readLoginResponse();
      final accessToken = loginResponse?.data?.accessToken;
      if (accessToken != null) {
        options.headers['authorization'] = 'Bearer $accessToken';
        options.headers['accept'] = 'application/json';
        handler.next(options);
      } else {
        await logoutService.logout();
        handler.reject(
          DioException(
            requestOptions: options,
            error: 'Access token not found',
            type: DioExceptionType.cancel,
          ),
          true,
        );
      }
    } catch (e) {
      debugPrint('Error retrieving access token: $e');
      handler.reject(
        DioException(
          requestOptions: options,
          error: e,
          type: DioExceptionType.unknown,
        ),
        true,
      );
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('${response.data}');
    debugPrint(
        '<-- ${response.statusCode} ${response.requestOptions.uri.toString()}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint('errornya : ${err.error}');
    debugPrint('errornya : $err dan $handler');
    if (err.response?.statusCode == 401) {
      debugPrint('Unauthorized access detected. Redirecting to login.');
      try {
        await logoutService.logout();
      } on DioException catch (logoutError) {
        debugPrint('Error during logout: $logoutError');
      }
    } else {
      debugPrint('Error in  ${err.response?.statusCode} $handler');
    }
    super.onError(err, handler);
  }
}
