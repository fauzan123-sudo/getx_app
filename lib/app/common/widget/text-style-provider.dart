import 'package:flutter/material.dart';

import '../constan/colors.dart';
import '../constan/integer.dart';

class LeonTextStyles {
  //  TextSize 10,12,16, 20

// Font 8
  static poppins8RegularBlack() {
    return TextStyle(
        fontSize: AppInteger.gFont8.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        color: Colors.black);
  }

  static poppins8BoldPrimary() {
    return TextStyle(
        fontSize: AppInteger.gFont8.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: Colors.black);
  }

  static poppins8ExtraLightPrimary() {
    return TextStyle(
        fontSize: AppInteger.gFont8.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w200,
        color: AppColors.bgPrimary);
  }

  static poppins8BoldWhite() {
    return TextStyle(
        fontSize: AppInteger.gFont8.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: Colors.white);
  }

  static poppins8BoldBlack() {
    return TextStyle(
        fontSize: AppInteger.gFont8.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: Colors.black);
  }

// Font 10
  static inter10BoldBlack() {
    return TextStyle(
        fontSize: AppInteger.gFont10.toDouble(),
        fontFamily: 'Inter',
        fontWeight: FontWeight.bold,
        color: Colors.black);
  }

  static inter10BoldPrimary() {
    return TextStyle(
        fontSize: AppInteger.gFont10.toDouble(),
        fontFamily: 'Inter',
        fontWeight: FontWeight.bold,
        color: AppColors.bgPrimary);
  }

  static inter10Primary() {
    return TextStyle(
        fontSize: AppInteger.gFont10.toDouble(),
        fontFamily: 'Inter',
        fontWeight: FontWeight.bold,
        color: AppColors.bgPrimary);
  }

  static inter12RegularBlack() {
    return TextStyle(
      fontSize: AppInteger.gFont12.toDouble(),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }

  static inter12RegularRed() {
    return TextStyle(
      fontSize: AppInteger.gFont12.toDouble(),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      color: AppColors.bgDanger,
    );
  }

  static inter12RegularBackLight200() {
    return TextStyle(
      fontSize: AppInteger.gFont12.toDouble(),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      color: AppColors.blackLight200,
    );
  }

  static inter10RegularBackLight300() {
    return TextStyle(
      fontSize: AppInteger.gFont12.toDouble(),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      color: AppColors.blackLight300,
    );
  }

  static poppins10RegularBlack() {
    return TextStyle(
        fontSize: AppInteger.gFont10.toDouble(),
        fontFamily: 'Poppins',
        // fontWeight: FontWeight,
        color: Colors.black);
  }

  static poppins10RegularDanger() {
    return TextStyle(
        fontSize: AppInteger.gFont10.toDouble(),
        fontFamily: 'Poppins',
        // fontWeight: FontWeight,
        color: AppColors.bgDanger);
  }

  static poppins10RegularWhite() {
    return TextStyle(
        fontSize: AppInteger.gFont10.toDouble(),
        fontFamily: 'Poppins',
        // fontWeight: FontWeight.w500,
        color: Colors.white);
  }

  static poppins10SemiBoldMuted() {
    return TextStyle(
        fontSize: AppInteger.gFont10.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        color: AppColors.textMuted);
  }

  static poppins10SemiBoldDanger() {
    return TextStyle(
        fontSize: AppInteger.gFont10.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        color: AppColors.bgDanger);
  }

  static poppins10BoldBlack() {
    return TextStyle(
        fontSize: AppInteger.gFont10.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: Colors.black);
  }

  static poppins10RegularMuted() {
    return TextStyle(
        fontSize: AppInteger.gFont10.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        color: AppColors.textMuted);
  }

  static poppins10SemiBoldBlack() {
    return TextStyle(
        fontSize: AppInteger.gFont10.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        color: Colors.black);
  }

  static poppins10BoldWhite() {
    return TextStyle(
        fontSize: AppInteger.gFont10.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: Colors.white);
  }

  static poppins10RegularPrimary() {
    return TextStyle(
        fontSize: AppInteger.gFont10.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        color: Colors.black);
  }

  static poppins10BoldPrimary() {
    return TextStyle(
        fontSize: AppInteger.gFont10.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: Colors.black);
  }

  static poppins10BoldDanger() {
    return TextStyle(
        fontSize: AppInteger.gFont10.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: AppColors.bgDanger);
  }

  static poppins10MediumBlack() {
    return TextStyle(
      fontSize: AppInteger.gFont10.toDouble(),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );
  }

  static poppins10MediumMuted() {
    return TextStyle(
      fontSize: AppInteger.gFont10.toDouble(),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      color: AppColors.textMuted,
    );
  }

// Font 12
  static poppins12RegularBlack() {
    return TextStyle(
        fontSize: AppInteger.gFont12.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        color: Colors.black);
  }

  static poppins12RegularBlackLight() {
    return TextStyle(
        fontSize: AppInteger.gFont13.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        color: AppColors.blackLight);
  }

  static poppins12RegularWhite() {
    return TextStyle(
        fontSize: AppInteger.gFont12.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        color: Colors.black);
  }

  static poppins12BoldBlack() {
    return TextStyle(
        fontSize: AppInteger.gFont12.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: Colors.black);
  }

  static poppins12SemiBoldBlack() {
    return TextStyle(
        fontSize: AppInteger.gFont12.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        color: Colors.black);
  }

  static poppins12SemiBoldPrimary() {
    return TextStyle(
        fontSize: AppInteger.gFont12.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        color: AppColors.bgPrimary);
  }

  static poppins12BoldWhite() {
    return TextStyle(
        fontSize: AppInteger.gFont12.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: Colors.white);
  }

  static poppins12RegularPrimary() {
    return TextStyle(
        fontSize: AppInteger.gFont12.toDouble(),
        fontFamily: 'Poppins',
        // fontWeight: FontWeight.w500,
        color: Colors.black);
  }

  static poppins12BoldPrimary() {
    return TextStyle(
        fontSize: AppInteger.gFont12.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: AppColors.bgPrimary);
  }

  static poppins12BoldMuted() {
    return TextStyle(
        fontSize: AppInteger.gFont12.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: AppColors.textMuted);
  }

  static poppins12Medium() {
    return TextStyle(
        fontSize: AppInteger.gFont12.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: AppColors.textMuted);
  }

// Font 14
  static poppins14BoldPrimary() {
    return TextStyle(
        fontSize: AppInteger.gFont14.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: AppColors.bgPrimary);
  }

// Font 16
  static poppins16SemiBoldBlack() {
    return TextStyle(
        fontSize: AppInteger.gFont16.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        color: Colors.black);
  }

  static poppins16BoldBlack() {
    return TextStyle(
        fontSize: AppInteger.gFont16.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: Colors.black);
  }

  static poppins16BoldWhite() {
    return TextStyle(
        fontSize: AppInteger.gFont16.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: Colors.white);
  }

// Font 20
  static poppins20RegularBlack() {
    return TextStyle(
        fontSize: AppInteger.gFont20.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        color: Colors.black);
  }

  static poppins20RegularWhite() {
    return TextStyle(
        fontSize: AppInteger.gFont20.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        color: Colors.white);
  }

  static poppins20BoldBlack() {
    return TextStyle(
        fontSize: AppInteger.gFont20.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: Colors.black);
  }

  static poppins20SemiBoldBlack() {
    return TextStyle(
        fontSize: AppInteger.gFont20.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        color: Colors.black);
  }

  static poppins20BoldWhite() {
    return TextStyle(
        fontSize: AppInteger.gFont20.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: Colors.white);
  }

  static poppins20RegularPrimary() {
    return TextStyle(
        fontSize: AppInteger.gFont20.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        color: Colors.black);
  }

  static poppins20BoldPrimary() {
    return TextStyle(
        fontSize: AppInteger.gFont20.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: Colors.black);
  }

  static poppins20BoldRed() {
    return TextStyle(
        fontSize: AppInteger.gFont20.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: AppColors.bgDanger);
  }
}
