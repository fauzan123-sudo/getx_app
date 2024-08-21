import 'package:dio/dio.dart';


import 'dart:developer';

import 'package:getx_app/app/data/provider/status_code.dart';

String handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      log("Connection Timeout: $error");
      return "Connection Timeout";
    case DioExceptionType.sendTimeout:
      log("Send Timeout: $error");
      return "Send Timeout";
    case DioExceptionType.receiveTimeout:
      log("Receive Timeout: $error");
      return "Receive Timeout";
    case DioExceptionType.badResponse:
      final statusCode = error.response?.statusCode;
      final responseBody = error.response?.data;
      if (statusCode != null) {
        switch (statusCode) {
          case StatusCode.badRequest:
            log("Bad Request: $responseBody");
            return "Bad Request";
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            log("Unauthorized: $responseBody");
            return "Unauthorized";
          case StatusCode.notFound:
            log("Not Found: $responseBody");
            return "Not Found";
          case StatusCode.conflict:
            log("Conflict: $responseBody");
            return "Conflict";
          case StatusCode.internalServerError:
            log("Internal Server Error: $responseBody");
            return "Internal Server Error";
        }
      }
      log("Bad Response: $responseBody");
      return "Bad Response";
    case DioExceptionType.cancel:
      log("Request Cancelled: $error");
      return "Request Cancelled";
    case DioExceptionType.unknown:
      log("No Internet Connection: $error");
      return "No Internet Connection";
    case DioExceptionType.badCertificate:
      log("Bad Certificate: $error");
      return "Internal Server Error";
    case DioExceptionType.connectionError:
      if (error.error == null) {
        log("Connection Error: No internet connection or server not reachable");
        return "Connection Error: No internet connection or server not reachable";
      } else {
        log("Connection Error: ${error.error}");
        return "Connection Error";
      }
  }
}
