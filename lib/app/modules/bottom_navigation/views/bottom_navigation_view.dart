import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_app/app/common/constan/colors.dart';
import 'package:getx_app/app/common/constan/icon.dart';
import 'package:getx_app/app/common/widget/svg_reusable.dart';
import 'package:getx_app/app/common/widget/text-style-provider.dart';
import 'package:getx_app/app/modules/bill/views/bill_view.dart';
import 'package:getx_app/app/modules/home/views/home_view.dart';
import 'package:getx_app/app/modules/payment/views/payment_view.dart';
import 'package:getx_app/app/modules/profile/views/profile_view.dart';
import 'package:getx_app/app/modules/report/views/report_view.dart';

import '../controllers/bottom_navigation_controller.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomeView(),
      const BillView(),
      const PaymentView(),
      const ReportView(),
      const ProfileView(),
    ];

    return GetBuilder<BottomNavigationController>(
      init: BottomNavigationController(),
      builder: (controller) {
        return WillPopScope(
          onWillPop: () async {
            if (controller.selectedIndex.value == 0) {
              bool shouldExit = await controller.showExitConfirmationDialog(context);
              return shouldExit;
            } else {
              controller.changePage(0);
              return false;
            }
          },
          child: Scaffold(
            body: Obx(() => pages[controller.selectedIndex.value]),
            bottomNavigationBar: Obx(
              () => controller.selectedIndex.value == 2
                  ? const SizedBox.shrink()  // Ganti 'null' dengan 'SizedBox.shrink()'
                  : Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: BottomAppBar(
                        color: Colors.white,
                        shadowColor: const Color.fromARGB(25, 0, 0, 0),
                        surfaceTintColor: Colors.white,
                        elevation: 10,
                        shape: const CircularNotchedRectangle(),
                        notchMargin: 12,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            buildNavigationBarItem(controller, 0, 'Home', AppIcon.iHome),
                            buildNavigationBarItem(controller, 1, 'Tagihan', AppIcon.iBill),
                            const Expanded(child: SizedBox()),
                            buildNavigationBarItem(controller, 3, 'Report', AppIcon.iReport),
                            buildNavigationBarItem(controller, 4, 'Profile', AppIcon.iUser),
                          ],
                        ),
                      ),
                    ),
            ),
            floatingActionButton: Obx(
              () => controller.selectedIndex.value == 2
                  ? const SizedBox.shrink()  // Sembunyikan FAB di halaman Payment
                  : Transform.scale(
                      scale: 1.2,
                      child: FloatingActionButton(
                        backgroundColor: AppColors.bgPrimary,
                        elevation: 4.0,
                        shape: const CircleBorder(),
                        onPressed: () => controller.changePage(2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppIcon.iMoney,
                              width: 25.0,
                              height: 25.0,
                              fit: BoxFit.fill,
                            ),
                            Text('Bayar', style: LeonTextStyles.poppins8BoldWhite()),
                          ],
                        ),
                      ),
                    ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          ),
        );
      },
    );
  }

  Widget buildNavigationBarItem(
      BottomNavigationController controller, int index, String title, String iconAsset) {
    return Expanded(
      child: InkWell(
        onTap: () {
          controller.changePage(index);
        },
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LeonSvgNoSize(
                assetName: iconAsset,
                color: controller.selectedIndex.value == index
                    ? AppColors.bgPrimary
                    : Colors.black,
                onTap: () {
                  controller.changePage(index);
                },
              ),
              Text(
                title,
                style: controller.selectedIndex.value == index
                    ? LeonTextStyles.poppins8BoldPrimary()
                    : LeonTextStyles.poppins8RegularBlack(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

