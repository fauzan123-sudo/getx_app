import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:getx_app/app/common/constan/colors.dart';
import 'package:getx_app/app/common/widget/text-style-provider.dart';
import 'package:intl/intl.dart';


import '../constan/integer.dart';

class LeonCalendar extends StatelessWidget {
  const LeonCalendar({
    super.key,
    required this.name,
    required this.hintText,
    this.validator,
  });

  final String name;
  final String hintText;
  final String? Function(DateTime?)? validator;

  @override
  Widget build(BuildContext context) {
    return FormBuilderDateTimePicker(
      name: name,
      style: LeonTextStyles.poppins10RegularMuted(),
      validator: validator,
      format: DateFormat('dd/MM/yyyy', 'id_ID'),
      // format: DateFormat('EEEE, dd MM yyyy', 'id_ID'),
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
      inputType: InputType.date,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.bgGrey,
        hintStyle: LeonTextStyles.poppins10RegularMuted(),
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: AppInteger.gSpace10),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppInteger.gSpace5),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppInteger.gSpace5),
          ),
          borderSide: BorderSide(
            color: AppColors.bgPrimary,
            width: 1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppInteger.gSpace5),
          ),
          borderSide: BorderSide(
            color: AppColors.bgPrimary,
          ),
        ),
      ),
    );
  }
}
