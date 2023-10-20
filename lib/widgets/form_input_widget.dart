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
      this.obscureText = false,
        this.initial,
        this.disabled = false,
      this.suffix,
      required this.keyboard});

  final String fieldName;
  final String? initial;
  final void Function(String) onChanged;
  final bool Function(String) validation;
  final String errorText;
  final TextInputType keyboard;
  final bool obscureText;
  final Widget? suffix;
  final bool disabled;
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
              fontSize: 16),
        ).paddingForOnly(bottom: 6),
        TextFormField(
            obscureText: obscureText,
            keyboardType: keyboard,
            initialValue: initial,
            readOnly: disabled,
            onChanged: (value) => onChanged(value),
            style: TextStyle(
              color: (disabled) ? CustomColors.Grey1 : CustomColors.white,
            ),
            validator: (value) {
              String name = value!.trim();
              return validation(name) ? errorText : null;
            },
            decoration: InputDecoration(
                suffixIcon: suffix,
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
                    borderSide:
                        const BorderSide(color: CustomColors.red, width: 2))))
      ],
    );
  }
}
