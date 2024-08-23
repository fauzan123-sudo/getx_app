import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/common/constan/url.dart';
import 'package:getx_app/app/common/widget/dialog.dart';
import 'package:getx_app/app/data/model/auth/login_response.dart';
import 'package:getx_app/app/data/model/bill/model_tagihan.dart';
import 'package:getx_app/app/data/network/bill_services.dart';
import 'package:getx_app/app/utils/filter_payment.dart';
import 'package:getx_app/app/utils/user_data.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class BillController extends GetxController with userDataMixin, PaymentFilter {
  final _refreshStateController =
      StreamController<SwipeRefreshState>.broadcast();
  Stream<SwipeRefreshState> get refreshStateStream =>
      _refreshStateController.stream;

  final api = BillService();
  var dataTagihan = <DataTagihan>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDataTagihan('', '', '');
    loadSiswaWali();
  }

  @override
  void onClose() {
    _refreshStateController.close();
    super.onClose();
  }

  Future loadDataTagihan(
      String? costType, String? startDate, String? endDate) async {
    final siswa = await checkStudent();
    if (siswa != null) {
      nisn.value = siswa.nisn ?? '';
      listTagihan(costType, nisn.value, startDate, endDate);
    } else {
      DialogHelper.showErrorDialog(
          Get.context!, 'kesalahan', 'data siswa kosong');
    }
  }

  void updateSelectedSiswa(SiswaWali siswa) async {
    try {
      await storageDB.value.saveStudentPicked(siswa);
      Get.snackbar('Info', 'Siswa berhasil dipilih dan disimpan');
      listTagihan(siswa.nisn!, '', '', '');
    } catch (e) {
      debugPrint('gagal menganti siswa $e');
    }
  }

  void listTagihan(String? nisn, String? costType, String? startDate,
      String? endDate) async {
    try {
      _refreshStateController.add(SwipeRefreshState.loading);
      isLoading(true);

      var result = await api.tagihanApi(
          '', costType ?? '', startDate ?? '', endDate ?? '', nisn ?? '');
      result.fold((failure) {
        debugPrint("Error: ${failure.message}");
        _refreshStateController.addError(failure);
      }, (data) {
        dataTagihan.assignAll(data.data ?? []);
        debugPrint('data tagihanya itu : ${data.data}');
        _refreshStateController.add(SwipeRefreshState.hidden);
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
