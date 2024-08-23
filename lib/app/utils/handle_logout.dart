import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/data/local/storage_db.dart';
import 'package:getx_app/app/modules/login/controllers/login_controller.dart';

class LogoutService {
  final StorageDB _storageDB = StorageDB();
  final LoginController _authController = Get.find<LoginController>();
  Future<void> logout() async {
    try {
      await _storageDB.deleteLoginResponse();
      final data = await _storageDB.readLoginResponse();
      _authController.setUnauthenticated();
      debugPrint('Data login sekarang $data');
    } catch (e) {
      debugPrint('Error during logout: $e');
    }
  }
}
