import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/common/constan/url.dart';
import 'package:getx_app/app/data/local/storage_db.dart';
import 'package:getx_app/app/data/model/auth/login_response.dart';

mixin userDataMixin {
  final storageDB = StorageDB().obs;
  final dataUser = LoginResponse().obs;
  final siswaWali = Rx<SiswaWali?>(null);
  final siswaList = <SiswaWali>[].obs;
  var namaWali = ''.obs;
  final nisn = ''.obs;
  var selectedStudent = Rxn<SiswaWali>();
  var isLoading = true.obs;
  

  Future<SiswaWali?> checkStudent() async {
    final dataUser = await storageDB.value.getStudentPicked();
    if (dataUser != null) {
      selectedStudent.value = dataUser;
      return dataUser;
    } else {
      var loginResponse = await storageDB.value.readLoginResponse();
      if (loginResponse != null &&
          loginResponse.data?.siswaWali?.isNotEmpty == true) {
        siswaWali.value = loginResponse.data!.siswaWali!.first;
        selectedStudent.value = loginResponse.data!.siswaWali![0];
        return siswaWali.value;
      } else {
        return null;
      }
    }
  }

  Future<void> loadSiswaWali() async {
    var loginResponse = await storageDB.value.readLoginResponse();
    if (loginResponse != null &&
        loginResponse.data != null &&
        loginResponse.data!.siswaWali != null &&
        loginResponse.data!.siswaWali!.isNotEmpty) {
      siswaList.assignAll(loginResponse.data!.siswaWali!);
    } else {
      debugPrint('Data siswa tidak ditemukan atau kosong');
    }
  }

  
}
