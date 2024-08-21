import 'package:flutter/material.dart';
import 'package:getx_app/app/common/constan/integer.dart';
import 'package:getx_app/app/common/widget/text-style-provider.dart';


class DefultButton extends StatelessWidget {
  const DefultButton(
      {super.key,
      required this.text,
      required this.press,
      required this.color});
  final String? text;
  final Function press;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press as void Function()?,
      child: Container(
        padding: EdgeInsets.all(AppInteger.gSpace15.toDouble()),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppInteger.gFont10.toDouble()),
          color: color,
        ),
        child: Center(
          child: Text(text!, style: LeonTextStyles.poppins12BoldWhite()),
        ),
      ),
    );
  }
}
