import 'package:flutter/material.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/widget_extensions.dart';

class FormInputWidget extends StatelessWidget {
  const FormInputWidget(
      {super.key,
      required this.fieldName,
      required this.onChanged,
      required this.validation,
      required this.errorText,
      required this.keyboard});

  final String fieldName;
  final void Function(String) onChanged;
  final bool Function(String) validation;
  final String errorText;
  final TextInputType keyboard;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: const TextStyle(
              color: CustomColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ).paddingForOnly(bottom: 10),
        TextFormField(
            keyboardType: keyboard,
            onChanged: (value) => onChanged(value),
            style: const TextStyle(
              color: CustomColors.white,
            ),
            validator: (value) {
              String name = value!.trim();
              return validation(name) ? errorText : null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        const BorderSide(color: CustomColors.white, width: 2)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        const BorderSide(color: CustomColors.white, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        const BorderSide(color: CustomColors.white, width: 2)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: CustomColors.red, width: 2))))
      ],
    );
  }
}
