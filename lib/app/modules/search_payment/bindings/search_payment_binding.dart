import 'package:get/get.dart';

import '../controllers/search_payment_controller.dart';

class SearchPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchPaymentController>(
      () => SearchPaymentController(),
    );
  }
}
