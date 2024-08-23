import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:getx_app/app/data/model/auth/login_response.dart';
import 'package:getx_app/app/data/model/payment/payment_model.dart';


import '../../common/constan/strings.dart';

class StorageDB {
  final _storage = const FlutterSecureStorage();

  Future<void> saveLoginResponse(LoginResponse loginResponse) async {
    try {
      final String jsonData = jsonEncode(loginResponse.toJson());
      await _storage.write(key: AppString.gUserSaved, value: jsonData);
      debugPrint('Login response berhasil disimpan.');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<LoginResponse?> readLoginResponse() async {
    try {
      String? jsonString = await _storage.read(key: AppString.gUserSaved);
      if (jsonString != null && jsonString.isNotEmpty) {
        Map<String, dynamic> jsonMap = json.decode(jsonString);
        return LoginResponse.fromJson(jsonMap);
      }
      return null;
    } catch (e) {
      debugPrint("Error reading login response from secure storage: $e");
      rethrow;
    }
  }

  Future<void> deleteLoginResponse() async {
    try {
      await _storage.delete(key: AppString.gUserSaved);
      debugPrint('Login response berhasil dihapus.');
    } catch (e) {
      debugPrint("Error deleting login response from secure storage: $e");
    }
  }

  Future<void> saveStudentPicked(SiswaWali siswaWali) async {
    try {
      String siswaJson = json.encode(siswaWali.toJson());
      await _storage.write(key: 'siswa_picked', value: siswaJson);
      debugPrint('berhasil menyimpan $siswaJson');
    } catch (e) {
      debugPrint('error menyimpan siswa yang dipilih');
    }
  }

  Future<SiswaWali?> getStudentPicked() async {
    try {
      String? siswaJson = await _storage.read(key: 'siswa_picked');
      if (siswaJson == null) {
        return null;
      }
      return SiswaWali.fromJson(json.decode(siswaJson));
    } catch (e) {
      debugPrint('error membaca siswa yang disimpan');
      return null;
    }
  }

  
  Future<String?> readStudentPick() async {
    try {
      return await _storage.read(key: 'nisn');
    } catch (e) {
      debugPrint('Error saat membaca data siswa: $e');
      return null;
    }
  }

  Future<void> saveVa(PaymentDetails paymentDetails) async {
    try {
      String siswaJson = json.encode(paymentDetails.toJson());
      await _storage.write(key: 'paymentDetails', value: siswaJson);
      debugPrint('berhasil menyimpan data');
    } catch (e) {
      debugPrint('Error saat menyimpan data va: $e');
      return;
    }
  }

  Future<PaymentDetails?> readVa() async {
    try {
      String? siswaJson = await _storage.read(key: 'paymentDetails');
      if (siswaJson == null) {
        return null;
      }
      return PaymentDetails.fromJson(json.decode(siswaJson));
    } catch (e) {
      debugPrint('Error saat membaca data va: $e');
      return null;
    }
  }
}
