import 'package:get/get.dart';
import 'package:getx_app/app/modules/bill/controllers/bill_controller.dart';
import 'package:getx_app/app/modules/home/controllers/home_controller.dart';
import 'package:getx_app/app/modules/payment/controllers/payment_controller.dart';
import 'package:getx_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:getx_app/app/modules/report/controllers/report_controller.dart';

import '../controllers/bottom_navigation_controller.dart';

class BottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationController>(
      () => BottomNavigationController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<BillController>(
      () => BillController(),
    );
    Get.lazyPut<PaymentController>(
      () => PaymentController(),
    );
    Get.lazyPut<ReportController>(
      () => ReportController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}

