import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/common/widget/dialog.dart';
import 'package:getx_app/app/data/local/storage_db.dart';
import 'package:getx_app/app/data/model/auth/login_response.dart';
import 'package:getx_app/app/data/network/auth_services.dart';
import 'package:getx_app/app/data/provider/error_handle.dart';
import 'package:getx_app/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final RxBool rememberMe = false.obs;
  final RxBool isLoggedIn = false.obs;
  final TextEditingController email =
      TextEditingController(text: '082244812291');
  final TextEditingController password =
      TextEditingController(text: '12345678');
  final authservice = AuthService();
  final db = StorageDB();
  var isLoading = false.obs;

  final RxString savedEmail = ''.obs;
  final RxString savedPassword = ''.obs;
  var siswaWali = <SiswaWali>[].obs;

  @override
  void onInit() {
    super.onInit();
    // userLoginCheck();
  }

  final _isAuthenticated = true.obs;

  bool get isAuthenticated => _isAuthenticated.value;

  void setUnauthenticated() {
    // _isAuthenticated.value = false;
    Get.offAllNamed(Routes.LOGIN);
  }

  void login() async {
    if (email.text.isEmpty || password.text.isEmpty) {
      Get.snackbar('Error', 'Email and password cannot be empty');
      isLoggedIn.value = false;
      return;
    }

    isLoading.value = true;
    final myUsername = email.text;
    final myPassword = password.text;

    final response = await authservice.login(myUsername, myPassword);
    response.fold(
      (error) => errorResponse(error),
      (success) => afterSuccessLogin(success),
    );
    isLoading.value = false;
  }

  void errorResponse(FailureModel error) {
    isLoading.value = false;
    Get.dialog(LeonDialog(
      title: 'Login Failed',
      content: '${error.message} ',
    ));
    debugPrint('Error: ${error.data}');
  }

  Future<void> afterSuccessLogin(LoginResponse success) async {
    isLoading.value = false;
    isLoggedIn.value = true;
    await db.saveLoginResponse(success);
    Get.offAllNamed(Routes.BOTTOM_NAVIGATION);
  }

  Future<void> userLoginCheck() async {
    try {
      isLoading.value = true;
      final dataUserLogin = await db.readLoginResponse();
      isLoading.value = false;

      if (dataUserLogin != null) {
        final namaWali = dataUserLogin.data?.namaWali;
        final firstArray = dataUserLogin.data?.siswaWali?.first;
        debugPrint('array pertama $firstArray');
        Get.dialog(LeonDialog(title: 'data tersimpan', content: '$namaWali'));
      }
      // else {
      //   Get.dialog(const LeonDialog(title: 'data kosong', content: "kosong"));
      // }
    } catch (e) {
      isLoading.value = false;
      debugPrint('Error during user login check: $e');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.dialog(const LeonDialog(
            title: 'Error', content: 'An error occurred during login check.'));
      });
    }
  }

  void logout() async {}
}
