import 'package:flutter/material.dart';


class LeonButtonBorder extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color? buttonColor;
  final Color? borderColor;
  final TextStyle? textStyle;

  const LeonButtonBorder({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.buttonColor,
    this.borderColor,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: borderColor ?? Colors.black, width: 1),
          ),
        ),
        child: Text(buttonText, style:textStyle),
      ),
    );
  }
}
