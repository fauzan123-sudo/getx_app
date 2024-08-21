import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:getx_app/app/common/constan/integer.dart';
import 'package:getx_app/app/common/widget/text-style-provider.dart';


Widget buildHandleEmptyPayment() {
  return Container(
    width: double.infinity,
    color: Colors.white,
    child: DottedBorder(
      color: Colors.black,
      strokeWidth: 1,
      child: Padding(
        padding: const EdgeInsets.all(AppInteger.gSpace20),
        child: Center(
          child: Column(
            children: [
              Text(
                "Data Kosong",
                style: LeonTextStyles.poppins10MediumMuted(),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
