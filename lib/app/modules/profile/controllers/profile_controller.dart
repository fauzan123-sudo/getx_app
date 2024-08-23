import 'package:get/get.dart';
import 'package:getx_app/app/routes/app_pages.dart';
import 'package:getx_app/app/utils/handle_logout.dart';

class ProfileController extends GetxController {
  final logoutService = LogoutService();
  void logout() async {
    await logoutService.logout();
    Get.offAllNamed(Routes.LOGIN);
  }
}
