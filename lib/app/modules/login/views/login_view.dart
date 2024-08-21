import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_app/app/common/constan/colors.dart';
import 'package:getx_app/app/common/constan/icon.dart';
import 'package:getx_app/app/common/constan/integer.dart';
import 'package:getx_app/app/common/constan/strings.dart';
import 'package:getx_app/app/common/widget/background_image.dart';
import 'package:getx_app/app/common/widget/form_reusable.dart';
import 'package:getx_app/app/common/widget/reuse_button.dart';
import 'package:getx_app/app/common/widget/sizebox.dart';
import 'package:getx_app/app/common/widget/svg_reusable.dart';
import 'package:getx_app/app/common/widget/text-style-provider.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: BackgroundImage(
                child: Padding(
              padding: const EdgeInsets.all(AppInteger.gSpace20),
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return _buildLoginForm();
                }
              }),
            ))));
  }

  Widget _buildLoginForm() {
    return Column(
      children: [
        _myAppBar(),
        const LeonSizeBox20(),
        _appLogo(),
        const LeonSizeBox30(),
        _myContent(),
        const LeonSizeBox20(),
        LeonTextField(
          controller: controller.email,
        ),
        const LeonSizeBox10(),
        LeonPasswordTextField(
          controller: controller.password,
        ),
        const LeonSizeBox20(),
        const LeonSizeBox10(),
        _buttonLogin(),
        Expanded(child: Container()),
        _footNote(),
        const LeonSizeBox10(),
      ],
    );
  }

  Widget _myAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppString.gLoginAppbar,
          style: LeonTextStyles.poppins12BoldPrimary(),
        ),
        LeonSvg(
            assetName: AppIcon.iCircleWarning,
            width: 24,
            height: 24,
            onTap: () {})
      ],
    );
  }

  Widget _appLogo() {
    return Container(
      padding: const EdgeInsets.all(AppInteger.gSpace30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppIcon.iLogo,
            width: 90,
            height: 73,
          ),
          const LeonSizeBox20(),
          Text(
            AppString.gSianwarApp,
            style: LeonTextStyles.poppins20BoldPrimary(),
          )
        ],
      ),
    );
  }

  Widget _myContent() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppString.gLoginToSianwar,
            style: LeonTextStyles.poppins20BoldBlack(),
          ),
          Text(
            AppString.gAppPaymentAndInfo,
            style: LeonTextStyles.poppins10RegularBlack(),
          ),
        ],
      ),
    );
  }

  Widget _buttonLogin() {
    return DefultButton(
      text: AppString.glogin.tr,
      press: () => controller.login(),
      color: AppColors.bgPrimary,
    );
  }

  Widget _footNote() {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: AppString.gPoweredBy,
          style: LeonTextStyles.poppins10RegularBlack()),
      TextSpan(
          text: AppString.gEraInfinity,
          style: LeonTextStyles.poppins10BoldBlack())
    ]));
  }
}
