import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:getx_app/app/common/constan/colors.dart';
import 'package:getx_app/app/common/widget/text-style-provider.dart';

class LeonDropdownFormField extends StatelessWidget {
  final List<String> items;
  final String? selectedItem;
  final String hint;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String?>? onChanged;
  final FormFieldSetter<String>? onSaved;

  const LeonDropdownFormField({
    super.key,
    required this.items,
    this.selectedItem,
    required this.hint,
    this.validator,
    this.onChanged,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.bgPrimary),
        ),
        filled: true, 
        fillColor: AppColors.bgGrey,
      ),
      isExpanded: true,
      hint: Text(
        hint,
        style: LeonTextStyles.poppins10RegularMuted(),
      ),
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ))
          .toList(),
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
    );
  }
}
