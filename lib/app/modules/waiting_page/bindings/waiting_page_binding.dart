import 'package:get/get.dart';

import '../controllers/waiting_page_controller.dart';

class WaitingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaitingPageController>(
      () => WaitingPageController(),
    );
  }
}
