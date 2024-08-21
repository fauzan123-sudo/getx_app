import 'package:flutter/material.dart';
import 'package:getx_app/app/common/constan/integer.dart';
import 'package:getx_app/app/common/constan/strings.dart';


import '../constan/colors.dart';

class LeonTextField extends StatelessWidget {
  final TextEditingController controller;
  const LeonTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 1,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: AppString.gUserName,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppInteger.gSpace10),
          borderSide: const BorderSide(color: AppColors.bgPrimary),
        ),
        filled: true,
        fillColor: const Color(0xFFDDE9E7),
      ),
    );
  }
}

class LeonPasswordTextField extends StatefulWidget {
  final TextEditingController controller;

  const LeonPasswordTextField({
    super.key,
    required this.controller,
  });

  @override
  LeonPasswordTextFieldState createState() => LeonPasswordTextFieldState();
}

class LeonPasswordTextFieldState extends State<LeonPasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: TextFormField(
        controller: widget.controller,
        maxLines: 1,
        obscureText: obscureText,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          labelText: 'Password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppInteger.gSpace10),
            borderSide: const BorderSide(color: AppColors.bgPrimary),
          ),
          filled: true,
          fillColor: const Color(0xFFDDE9E7),
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          ),
        ),
      ),
    );
  }
}
