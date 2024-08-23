import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/common/widget/dialog.dart';
import 'package:getx_app/app/data/model/auth/login_response.dart';
import 'package:getx_app/app/data/model/payment/payment_model.dart';
import 'package:getx_app/app/utils/user_data.dart';
import 'package:intl/intl.dart';

class WaitingPageController extends GetxController with userDataMixin {
  var paymentDetails = PaymentDetails().obs;
  var namaSiswa = ''.obs;
  Timer? _countdownTimer;
  final RxString timeRemaining = ''.obs; // Observable untuk waktu tersisa
  late DateTime expiredDateTime; // Waktu kedaluwarsa

  @override
  void onInit() {
    loadDataUser();
    super.onInit();
  }

  @override
  void onClose() {
    _countdownTimer?.cancel();
    super.onClose();
  }

  void loadDataUser() async {
    final siswa = await checkStudent();
    if (siswa != null) {
      nisn.value = siswa.nisn ?? '';
      loadPaymentDetails();
    } else {
      DialogHelper.showErrorDialog(
          Get.context!, 'kesalahan', 'data siswa kosong');
    }
  }

  Future<void> loadPaymentDetails() async {
    isLoading.value = true;
    PaymentDetails? details = await storageDB.readVa();
    if (details != null) {
      paymentDetails.value = details;
      startCountdown(details.expired ?? '2024-08-03 00:01:00');
    } else {
      debugPrint('data va kosong');
      startCountdown('2024-08-03 11:11:00');
    }
    isLoading.value = false;
  }

  void startCountdown(String expiredString) {
    try {
      debugPrint('Expired string: $expiredString');

      // Format yang digunakan untuk parsing tanggal
      final dateFormat = DateFormat(
          'EEEE, d MMMM yyyy, HH:mm', 'id_ID'); // Format lokal Bahasa Indonesia

      // Parsing string menjadi DateTime
      expiredDateTime = dateFormat.parse(expiredString);

      _countdownTimer?.cancel(); // Cancel any existing timer

      _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        final now = DateTime.now();
        final difference = expiredDateTime.difference(now);

        if (difference.isNegative) {
          timeRemaining.value = 'Expired';
          timer.cancel();
        } else {
          final hours = difference.inHours.toString().padLeft(2, '0');
          final minutes =
              (difference.inMinutes % 60).toString().padLeft(2, '0');
          final seconds =
              (difference.inSeconds % 60).toString().padLeft(2, '0');
          timeRemaining.value = '$hours jam $minutes menit $seconds detik';
          debugPrint('Time remaining: ${timeRemaining.value}');
        }
      });
    } catch (e) {
      timeRemaining.value = 'Invalid Date Format';
      debugPrint('Error in startCountdown: $e');
    }
  }

  void copyNoVaToClipboard(String noVa) {
    Clipboard.setData(ClipboardData(text: noVa));
    Get.snackbar('Salin Nomor VA', 'Nomor VA berhasil disalin ke clipboard',
        snackPosition: SnackPosition.BOTTOM);
  }
}
