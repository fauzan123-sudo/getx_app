import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:getx_app/app/common/constan/url.dart';
import 'package:getx_app/app/data/local/storage_db.dart';
import 'package:getx_app/app/data/model/bill/model_tagihan.dart';
import 'package:getx_app/app/data/provider/error_handle.dart';
import 'package:getx_app/app/data/provider/handle_dio_error.dart';
import 'package:getx_app/app/utils/dio_inteceptor.dart';


class BillService {
  final StorageDB secureStorage = StorageDB();

  final Dio _dio;

  BillService()
      : _dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 20))) {
    _dio.interceptors.add(AuthInterceptor());
    _dio.interceptors.add(AwesomeDioInterceptor());
  }

  Future<Either<FailureModel, TagihanResponse>> tagihanApi(
    String value,
    String nisn,
    String tipe,
    String dueDateStart,
    String dueDateEnd,
  ) async {
    final uri = Uri.parse(AppUrl.list_tagihan).replace(
      queryParameters: {
        'search': value,
        'tipe': tipe,
        'due_date_start': dueDateStart,
        'due_date_end': dueDateEnd,
        'nisn': nisn,
      },
    );
    debugPrint('nisn : $nisn dan value : $value');
    try {
      var response = await _dio.get(uri.toString());

      if (response.statusCode == 200) {
        final data = TagihanResponse.fromJson(response.data);
        return Right(data);
      } else {
        debugPrint('Error debug: ${response.statusMessage}');
        throw Exception('Error: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      final errorMsg = handleDioError(e);
      final errorModel = FailureModel(
        // statusCode: e.response?.statusCode,
        message: errorMsg,
      );
      debugPrint('Error DioException debug: $e');
      return Left(errorModel);
    } catch (e) {
      final errorModel = FailureModel(message: e.toString());
      debugPrint('Error debug: $errorModel');
      return Left(errorModel);
    }
  }
}