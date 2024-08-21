import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

import '../constan/colors.dart';

class LeonDash extends StatelessWidget {
  const LeonDash({super.key});

  @override
  Widget build(BuildContext context) {
    return const DottedLine(
      dashColor: AppColors.blackLight300,
    );
  }
}
