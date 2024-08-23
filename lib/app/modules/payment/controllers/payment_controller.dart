import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/common/constan/url.dart';
import 'package:getx_app/app/common/widget/dialog.dart';
import 'package:getx_app/app/data/model/auth/login_response.dart';
import 'package:getx_app/app/data/model/bill/model_tagihan.dart';
import 'package:getx_app/app/data/model/payment/payment_model.dart';
import 'package:getx_app/app/data/network/bill_services.dart';
import 'package:getx_app/app/data/network/payment_service.dart';
import 'package:getx_app/app/utils/user_data.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class PaymentController extends GetxController with userDataMixin {
  final api = BillService();
  final apiPayment = PaymentService();
  var dataTagihan = <DataTagihan>[].obs;
  final selectedItems = <ListTagihan>{}.obs;
  var paymentDetails = PaymentDetails().obs;

  final _refreshStateController =
      StreamController<SwipeRefreshState>.broadcast();
  Stream<SwipeRefreshState> get refreshStateStream =>
      _refreshStateController.stream;

  @override
  void onInit() {
    _refreshStateController.close();
    loadDataTagihan('', '', '');
    super.onInit();
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

  void updateSelectedSiswa(SiswaWali siswa) async {
    try {
      selectedItems.clear();
      await storageDB.value.saveStudentPicked(siswa);
      Get.snackbar('Info', 'Siswa berhasil dipilih dan disimpan');
      listTagihan(siswa.nisn!, '', '', '');
    } catch (e) {
      debugPrint('gagal menganti siswa $e');
    }
  }

  void selectItem(ListTagihan item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
  }

  Future pay(String nisn, String idTagihan, BuildContext context) async {
    try {
      isLoading.value = true;
      final result = await apiPayment.paymentAPi(nisn, idTagihan);
      result.fold((failure) {
        debugPrint('Error: ${failure.message}');
        showConfirmationDialog(context);
      }, (data) {
        paymentDetails.value = data.data?.dataPembayaran ?? PaymentDetails();
        storageDB.value.saveVa(paymentDetails.value);
        Get.toNamed(Routes.WAITING_PAGE);

        debugPrint('datanya : $data');
      });
    } catch (e) {
      debugPrint('$e');
    } finally {
      isLoading.value = false;
    }

    debugPrint('NISN : $nisn dan id Tagihanya : $idTagihan');
  }
}
