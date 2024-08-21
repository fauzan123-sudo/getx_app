import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/data/network/home.dart';

class HomeController extends GetxController {
  final api = HomeService();

  @override
  void onInit() {
    super.onInit();
    loadDataHome();
  }

  Future loadDataHome() async {
    debugPrint('data di load');
    final data = await api.mainHomeAPi('1299', '');
    data.fold((l) => Get.snackbar('error', '$l'), (r) => debugPrint('$r'));
  }
}
