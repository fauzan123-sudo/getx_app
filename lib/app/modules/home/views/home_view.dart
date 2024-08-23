import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_app/app/common/constan/colors.dart';
import 'package:getx_app/app/common/constan/icon.dart';
import 'package:getx_app/app/common/constan/integer.dart';
import 'package:getx_app/app/common/constan/strings.dart';
import 'package:getx_app/app/common/widget/appbar_reusable.dart';
import 'package:getx_app/app/common/widget/background_image.dart';
import 'package:getx_app/app/common/widget/bottom_sheet.dart';
import 'package:getx_app/app/common/widget/dialog.dart';
import 'package:getx_app/app/common/widget/handle_empty.dart';
import 'package:getx_app/app/common/widget/sizebox.dart';
import 'package:getx_app/app/common/widget/svg_reusable.dart';
import 'package:getx_app/app/common/widget/text-style-provider.dart';
import 'package:getx_app/app/modules/home/widget/cardview.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
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
                await controller.loadDataHome();
              },
              stateStream: controller.refreshStateStream,
              children: [
                _myBody(controller),
              ],
            )),
          ));
        });
  }

  Widget _buildChangeUser(HomeController controller) {
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

  Widget _myBody(HomeController controller) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppInteger.gSpace20, AppInteger.gSpace20, AppInteger.gSpace20, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection1(controller),
          const LeonSizeBox10(),
          _buildCardViewSisaTagihan(controller),
          const LeonSizeBox10(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCardviewSudahDibayar(controller),
              const SizedBox(width: AppInteger.gSpace10),
              _buildCardViewTotalTagihan(controller),
            ],
          ),
          const LeonSizeBox10(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppString.gPaymentHistory,
                  style: LeonTextStyles.poppins12BoldBlack()),
              InkWell(
                onTap: () {
                  // Get.toNamed(Routes.PAYMENT_HISTORY);
                },
                child: Text(AppString.gLookAll,
                    style: LeonTextStyles.poppins10RegularBlack()),
              ),
            ],
          ),
          const LeonSizeBox10(),
          _buildListRiwayatPembayaran(controller),
        ],
      ),
    );
  }

  Widget _buildSection1(HomeController controller) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(AppString.gSmpAnnur,
                style: LeonTextStyles.poppins16SemiBoldBlack()),
            Text(AppString.gStreetNum,
                style: LeonTextStyles.poppins12RegularBlack()),
          ]),
          LeonSvgNoSize(
            assetName: AppIcon.iBook,
            onTap: () {},
          )
        ],
      ),
    );
  }

  Widget _buildCardViewSisaTagihan(HomeController controller) {
    return LeonCardView(
      elevation: 20,
      padding: const EdgeInsets.all(20),
      strokeWidth: 0,
      strokeColor: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              AppString.gRestOfBill,
              style: LeonTextStyles.poppins10BoldWhite(),
            ),
            Obx(() => Text('${controller.sisaTagihan}',
                style: LeonTextStyles.poppins16BoldWhite())),
          ]),
        ],
      ),
    );
  }

  Widget _buildCardviewSudahDibayar(HomeController controller) {
    return Expanded(
      child: LeonCardView(
        elevation: 20,
        useGradient: false,
        solidColor: AppColors.bgPrimary20,
        padding: const EdgeInsets.all(AppInteger.gSpace10),
        strokeWidth: 2,
        strokeColor: AppColors.bgPrimary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppString.gAfterPay,
                style: LeonTextStyles.poppins10SemiBoldBlack()),
            Obx(() => Text('${controller.sudahDibayar}',
                style: LeonTextStyles.poppins16BoldBlack())),
          ],
        ),
      ),
    );
  }

  Widget _buildCardViewTotalTagihan(HomeController controller) {
    return Expanded(
      child: LeonCardView(
        elevation: 20,
        useGradient: false,
        solidColor: AppColors.bgSecondary,
        padding: const EdgeInsets.all(AppInteger.gSpace10),
        strokeWidth: 2,
        strokeColor: AppColors.bgPrimary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppString.gBillTotal,
                style: LeonTextStyles.poppins10SemiBoldBlack()),
            Obx(() => Text('${controller.totalTagihan}',
                style: LeonTextStyles.poppins16BoldBlack())),
          ],
        ),
      ),
    );
  }

  Widget _buildListRiwayatPembayaran(HomeController controller) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (controller.riwayatPembayaranList.isEmpty) {
        return buildHandleEmptyPayment();
      } else {
        return ListView.separated(
          itemCount: controller.riwayatPembayaranList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            var item = controller.riwayatPembayaranList[index];
            return InkWell(
              onTap: () {
                Get.bottomSheet(
                  LeonBottomSheet(
                      cost: item.total ?? '',
                      label: item.status ?? 0,
                      statusString: item.statusString!,
                      newDate: item.tanggal,
                      newTime: '',
                      newItem: item),
                  backgroundColor: Colors.white,
                  isScrollControlled: true,
                );
              },
              child: LeonCardList(
                statusString: item.statusString ?? '',
                date: item.tanggal ?? '',
                label: item.status ?? 0,
                description: item.biaya ?? '',
                cost: item.total ?? '',
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 10,
            );
          },
        );
      }
    });
  }
}
