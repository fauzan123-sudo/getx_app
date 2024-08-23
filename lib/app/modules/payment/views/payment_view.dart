import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_app/app/common/constan/colors.dart';
import 'package:getx_app/app/common/constan/icon.dart';
import 'package:getx_app/app/common/constan/integer.dart';
import 'package:getx_app/app/common/widget/appbar_reusable.dart';
import 'package:getx_app/app/common/widget/background_image.dart';
import 'package:getx_app/app/common/widget/button_reusable.dart';
import 'package:getx_app/app/common/widget/cardview_reusable.dart';
import 'package:getx_app/app/common/widget/svg_reusable.dart';
import 'package:getx_app/app/common/widget/text-style-provider.dart';
import 'package:getx_app/app/data/model/bill/model_tagihan.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
        init: PaymentController(),
        builder: (controller) {
          return SafeArea(
              child: Scaffold(
            appBar: LeonAppBar(
              title: _buildChangeUser(controller),
              leadingAvatar: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://plus.unsplash.com/premium_photo-1687558246422-e94f0864d467?q=80&w=1530&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                ),
                radius: 20,
              ),
              showBackArrow: false,
              actions: [
                LeonSvgNoSize(
                  assetName: AppIcon.iNotification,
                  onTap: () {},
                ),
              ],
            ),
            body: BackgroundImage(
                child: SwipeRefresh.material(
              onRefresh: () async {
                await controller.loadDataTagihan('', '', '');
              },
              stateStream: controller.refreshStateStream,
              children: [
                _buildBody(controller),
              ],
            )),
            bottomNavigationBar: _buildBottomNavigationBar(controller),
          ));
        });
  }

  Widget _buildChangeUser(PaymentController controller) {
    return GestureDetector(
      onTap: () {
        controller.showSiswaWaliDialog();
      },
      child: Row(
        children: [
          Obx(() {
            // return Column();
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
          LeonSvg(
            assetName: AppIcon.iDownArrow,
            onTap: () {
              controller.showSiswaWaliDialog();
            },
            width: 18,
            height: 18,
          )
        ],
      ),
    );
  }

  Widget _buildBody(PaymentController controller) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.dataTagihan.isEmpty) {
          return const Center(child: Text('Data kosong'));
        } else {
          return ListView.separated(
            itemCount: controller.dataTagihan.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 4.0,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              var item = controller.dataTagihan[index];
              return itemTagihan(item, controller);
            },
          );
        }
      }),
    );
  }

  Widget itemTagihan(DataTagihan item, PaymentController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "BIAYA TA ${item.periode}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        ...item.list!.map((item) => buildBiayaItem(item, controller)),
      ],
    );
  }

  Widget buildBiayaItem(ListTagihan item, PaymentController controller) {
    return Obx(() => LeonCardView(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, AppInteger.gSpace10),
          padding: const EdgeInsets.all(AppInteger.gSpace10),
          onPressed: () => controller.selectItem(item),
          cardColor: controller.selectedItems.contains(item)
              ? AppColors.bgPrimaryLight
              : Colors.white,
          borderColor: AppColors.bgPrimary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.namaBiaya ?? '',
                  style: LeonTextStyles.poppins10SemiBoldBlack().copyWith(
                    color: controller.selectedItems.contains(item)
                        ? Colors.white
                        : Colors.black,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Jatuh Tempo: ${item.tanggalJatuhTempo}',
                      style: LeonTextStyles.poppins10MediumBlack().copyWith(
                        color: controller.selectedItems.contains(item)
                            ? Colors.white
                            : Colors.black,
                      )),
                  Text(item.nominal!,
                      style: LeonTextStyles.poppins10SemiBoldDanger().copyWith(
                        color: controller.selectedItems.contains(item)
                            ? AppColors.bgSecondary
                            : Colors.black,
                      )),
                ],
              ),
            ],
          ),
        ));
  }

  Widget _buildBottomNavigationBar(PaymentController controller) {
    return LeonCardTopShadow(
        width: double.infinity,
        color: Colors.white,
        shadowColor: Colors.black,
        shadowBlurRadius: 10,
        shadowOffset: const Offset(0, 5),
        padding: const EdgeInsets.all(AppInteger.gSpace10),
        child: LeonButtonBorder(
          borderColor: AppColors.bgPrimary,
          buttonColor: AppColors.bgPrimary,
          onPressed: () {
            var selectItemId = controller.selectedItems
                .map((item) => item.tagihanId)
                .join(',');
            debugPrint('Selected Tagihan IDs: $selectItemId');
            controller.pay('${controller.nisn}', selectItemId, Get.context!);
            // Get.toNamed(Routes.WAITING_PAGE);
          },
          buttonText: 'BAYAR',
          textStyle: LeonTextStyles.poppins12BoldWhite(),
        ));
  }
}
