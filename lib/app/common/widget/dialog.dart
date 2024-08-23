import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/common/constan/icon.dart';
import 'package:getx_app/app/common/constan/integer.dart';
import 'package:getx_app/app/common/widget/svg_reusable.dart';
import 'package:getx_app/app/common/widget/text-style-provider.dart';
import 'package:quickalert/quickalert.dart';

// import '../../modules/home/controllers/home_controller.dart';

class LeonDialog extends StatelessWidget {
  final String title;
  final String content;

  const LeonDialog({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Get.back(); // Tutup dialog
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}

class LeonDialogListView extends StatelessWidget {
  const LeonDialogListView({super.key});

  @override
  Widget build(BuildContext context) {
    // final HomeController controller = Get.find();
    return AlertDialog(
      backgroundColor: Colors.transparent,
      // title: const Text('title'),
      content: Padding(
        padding: const EdgeInsets.all(AppInteger.gSpace10),
        child: Container(
          height: 300,
          width: 300,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Column(
            children: [
              LeonSvgNoSize(
                  assetName: AppIcon.iCircleClose,
                  onTap: () {
                    Navigator.of(context).pop();
                  }),
              Center(
                child: Text(
                    'Mau lihat Data Pembayaran atau Raport anak anda yang mana?',
                    style: LeonTextStyles.poppins12BoldWhite()),
              ),
              Obx(() => ListView.separated(
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 4.0,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {

                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class DialogHelper {
  static void showSuccessDialog(
      BuildContext context, String title, String text) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: title,
      text: text,
    );
  }

  // static showLoadingDialog(BuildContext context) {
  //   QuickAlert.show(
  //     context: context,
  //     type: QuickAlertType.loading,
  //     title: 'loading',
  //   );
  // }

  static void showErrorDialog(BuildContext context, String title, String text) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: title,
      text: text,
    );
  }

  static void showWarningDialog(
      BuildContext context, String title, String text) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.warning,
      title: title,
      text: text,
    );
  }

  static void showLogoutDialog(BuildContext context) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      title: 'Keluar dari Aplikasi',
      text: 'Apakah Anda yakin ingin keluar dari aplikasi?',
      confirmBtnText: 'Ya',
      cancelBtnText: 'Tidak',
    );
  }
}

showLoadingDialog(BuildContext context) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.loading,
    title: 'loading',
  );
}
