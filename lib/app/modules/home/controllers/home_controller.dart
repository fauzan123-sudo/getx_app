import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/common/constan/url.dart';
import 'package:getx_app/app/common/widget/dialog.dart';
import 'package:getx_app/app/data/model/auth/login_response.dart';
import 'package:getx_app/app/data/model/home/main_home_response.dart';
import 'package:getx_app/app/data/network/home_services.dart';
import 'package:getx_app/app/utils/user_data.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class HomeController extends GetxController with userDataMixin {
  final api = HomeService();
  var riwayatPembayaranList = <RiwayatPembayaran>[].obs;
  var sisaTagihan = ''.obs;
  var sudahDibayar = ''.obs;
  var totalTagihan = ''.obs;

  final _refreshStateController =
      StreamController<SwipeRefreshState>.broadcast();
  Stream<SwipeRefreshState> get refreshStateStream =>
      _refreshStateController.stream;

  @override
  void onInit() {
    super.onInit();
    loadDataHome();
    loadSiswaWali();
  }

  @override
  void onClose() {
    _refreshStateController.close();
    super.onClose();
  }

  Future loadDataHome() async {
    final siswa = await checkStudent();
    if (siswa != null) {
      nisn.value = siswa.nisn ?? '';
      fetchListPembayaran(nisn.value);
    } else {
      DialogHelper.showErrorDialog(
          Get.context!, 'kesalahan', 'data siswa kosong');
    }
  }

  void updateSelectedSiswa(SiswaWali siswa) async {
    try {
      await storageDB.value.saveStudentPicked(siswa);
      Get.snackbar('Info', 'Siswa berhasil dipilih dan disimpan');
      loadDataHome();
      fetchListPembayaran(siswa.nisn!);
    } catch (e) {
      debugPrint('gagal menganti siswa $e');
    }
  }

  void fetchListPembayaran(String nisn) async {
    try {
      _refreshStateController.add(SwipeRefreshState.loading);
      isLoading(true);
      var homeService = HomeService();
      var result = await homeService.mainHomeAPi(nisn, '');
      result.fold((failure) {
        debugPrint("Error: ${failure.message}");
        _refreshStateController.addError(failure);
      }, (mainHomeResponse) {
        if (mainHomeResponse.data != null) {
          var data = mainHomeResponse.data!;
          sisaTagihan(data.sisaTagihan ?? 'N/A');
          sudahDibayar(data.sudahDibayar?.toString() ?? 'N/A');
          totalTagihan(data.totalTagihan?.toString() ?? 'N/A');

          riwayatPembayaranList.value =
              mainHomeResponse.data?.riwayatPembayaran ?? [];
          _refreshStateController.add(SwipeRefreshState.hidden);
        } else {
          debugPrint("MainHomeResponse data is null");
        }
      });
    } finally {
      isLoading(false);
    }
  }

  void showSiswaWaliDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Pilih Siswa'),
        content: Obx(() {
          if (siswaList.isEmpty) {
            return const Text('Tidak ada siswa tersedia.');
          } else {
            return Container(
              width: double.maxFinite,
              height: 300,
              color: Colors.white,
              child: ListView.builder(
                itemCount: siswaList.length,
                itemBuilder: (context, index) {
                  final siswa = siswaList[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(siswa.foto ?? AppUrl.ImageUser),
                    ),
                    title: Text(siswa.nama ?? '-'),
                    subtitle: Text('Kelas : ${siswa.kelas!}'),
                    onTap: () {
                      // Handle the selection of a student
                      nisn.value = siswa.nisn ?? '';
                      updateSelectedSiswa(siswa);
                      Get.back(); // Close the dialog
                    },
                  );
                },
              ),
            );
          }
        }),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close the dialog
            },
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }
}
