import 'package:get/get.dart';

import '../controllers/payment_to_bank_controller.dart';

class PaymentToBankBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentToBankController>(
      () => PaymentToBankController(),
    );
  }
}
