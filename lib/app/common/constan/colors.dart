import 'package:flutter/material.dart';

class AppColors {
  static const Color bgPrimary        = Color(0xFF0B4C43);
  static const Color bgPrimaryLight   = Color(0xFF139986);
  static const Color bgPrimary20      = Color.fromARGB(20, 11, 76, 67);
  static const Color bgDanger         = Color(0xFFC62424);
  static const Color btnPrimaryHover  = Color(0xFF0E7869);
  static const Color blackLight       = Color(0xFF484848);
  static const Color borderPrimary    = Color(0xFF0B4C43);
  static const Color bgSecondary      = Color(0xFFEBD006);
  static const Color bgSuccess        = Color(0xFF14A44D);
  static const Color bgInfo           = Color(0xFF54B4D3);
  static const Color bgBlue           = Color(0xFF3B71CA);
  static const Color bgGrey           = Color(0xFFDDE9E7);
  static const Color textMuted        = Color.fromRGBO(0, 0, 0, 0.5);
  // static const Color textMuted        = Color.fromARGB(70, 255, 255, 255);
  static const Color greyLight        = Color(0xFFF8F9FA);
  static const Color blackLight300    = Color(0xFFAEADAD);
  static const Color blackLight200    = Color(0xFF757575);
  static const LinearGradient customGradient = LinearGradient(
    colors: [Color(0xFF1E7C6F), Color(0xFF0B4C43)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}