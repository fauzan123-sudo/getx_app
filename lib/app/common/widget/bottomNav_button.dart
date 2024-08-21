import 'package:flutter/material.dart';
import 'package:getx_app/app/common/constan/colors.dart';
import 'package:getx_app/app/common/widget/text-style-provider.dart';


class BottomNavigationBarButton extends StatelessWidget {
  const BottomNavigationBarButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      color: AppColors.bgPrimary,
      width: double.infinity,
      // height: 48.0,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.bgSuccess,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          title,
          style:LeonTextStyles.poppins12BoldWhite(),
        ),
      ),
    );
  }
}
