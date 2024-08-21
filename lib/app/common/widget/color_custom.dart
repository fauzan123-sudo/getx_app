import 'package:flutter/material.dart';

import '../constan/colors.dart';

Color getStatusColor(int? status) {
  switch (status) {
    case 0:
      return AppColors.bgSecondary;
    case 1:
      return AppColors.bgSuccess;
    case 2:
      return AppColors.bgDanger;
    default:
      return Colors.grey;
  }
}
