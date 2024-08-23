import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:getx_app/app/common/constan/icon.dart';
import 'package:getx_app/app/common/widget/appbar_reusable.dart';
import 'package:getx_app/app/common/widget/cardview_reusable.dart';
import 'package:getx_app/app/common/widget/divider.dart';
import 'package:getx_app/app/common/widget/sizebox.dart';
import 'package:getx_app/app/common/widget/svg_reusable.dart';
import 'package:getx_app/app/common/widget/text-style-provider.dart';

import '../controllers/waiting_page_controller.dart';

class WaitingPageView extends StatelessWidget {
  const WaitingPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WaitingPageController>(
      init: WaitingPageController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: LeonAppBar(
              title: _buildChangeUser(controller),
              showBackArrow: true,
              actions: [
                LeonSvgNoSize(
                  assetName: AppIcon.iNotification,
                  onTap: () {},
                ),
              ],
            ),
            body: _buildBody(controller, context),
          ),
        );
      },
    );
  }

  Widget _buildChangeUser(WaitingPageController controller) {
    return Row(
      children: [
        Obx(() {
          if (controller.selectedStudent.value != null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(controller.selectedStudent.value!.nama!,
                    style: LeonTextStyles.poppins12BoldBlack()),
                Text(controller.namaWali.value,
                    style: LeonTextStyles.poppins10RegularBlack()),
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Data Belum ada',
                    style: LeonTextStyles.poppins12BoldBlack()),
                Text('Data Belum ada',
                    style: LeonTextStyles.poppins10RegularBlack()),
              ],
            );
          }
        }),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

Widget _buildBody(WaitingPageController controller, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      LeonCardView(
        borderRadius: 0,
        padding: const EdgeInsetsDirectional.all(10),
        onPressed: () {},
        cardColor: Colors.white,
        borderColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Pembayaran",
                  style: LeonTextStyles.inter12RegularBlack(),
                ),
                Obx(() => Text(
                      controller.paymentDetails.value.amount?.toString() ?? '0',
                      style: LeonTextStyles.inter12RegularRed(),
                    )),
              ],
            ),
            const LeonDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Bayar Dalam"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Obx(() => Text(
                          controller.timeRemaining
                              .value, // Menampilkan countdown timer
                          style: LeonTextStyles.inter12RegularRed(),
                        )),
                    Obx(() => Text(
                        controller.paymentDetails.value.expired?.toString() ??
                            '0',
                        style: LeonTextStyles.inter12RegularBackLight200())),
                  ],
                )
              ],
            )
          ],
        ),
      ),
      const LeonSizeBox10(),
      LeonCardBottomShadow(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          shadowOffset: const Offset(0, 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    AppIcon.iBriLogo,
                  ),
                  const LeonSizeBox10Width(),
                  Expanded(
                    flex: 2,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bank BRI",
                            style: LeonTextStyles.inter12RegularBlack(),
                          ),
                          const LeonSizeBox10(),
                          const LeonDivider(),
                          const LeonSizeBox10(),
                          Text("No Rek. Virtual Account",
                              style:
                                  LeonTextStyles.inter10RegularBackLight300()),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Obx(() => Text(
                                        controller.paymentDetails.value.noVa ??
                                            "0",
                                        style:
                                            LeonTextStyles.poppins20BoldRed(),
                                      )),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.copyNoVaToClipboard(
                                        controller.paymentDetails.value.noVa ??
                                            "0");
                                  },
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(AppIcon.icCopy),
                                      Text("Salin",
                                          style: LeonTextStyles
                                              .poppins12BoldMuted()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const LeonDivider(),
                          const LeonSizeBox10(),
                          Text(
                              "Proses Verifikasi kurang dari 10 menit setelah pembayaran",
                              style: LeonTextStyles.poppins12SemiBoldPrimary()),
                          const LeonSizeBox10(),
                          Text(
                            "Bayar Tagihan ke Virtual Account di atas sebelum sesi pembayaran ini habis, silahkan bayar melalui Transfer mBanking, Transfer iBanking atau Transfer ATM. ",
                            style: LeonTextStyles.poppins12RegularBlackLight(),
                          ),
                          const LeonSizeBox10(),
                          Text(
                            "Bisa tranfer melalui Bank selain BRI",
                            style: LeonTextStyles.poppins12RegularBlackLight(),
                          ),
                        ]),
                  ),
                ],
              ),
            ],
          ))
    ],
  );
}
