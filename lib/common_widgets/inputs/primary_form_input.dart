import 'package:first_bank_app/common_widgets/text/primary_text.dart';
import 'package:first_bank_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryFormInput extends StatelessWidget {
  const PrimaryFormInput({
    super.key,
    this.focusNode,
    this.placeholder = '',
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.onTap,
    this.disable = false,
    this.maxLines = 1,
    this.keyboardType,
    this.errorText,
    this.inputFormatters,
    this.label,
  });
  final String placeholder;
  final FocusNode? focusNode;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final void Function()? onTap;
  final bool disable;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: Spacing.s8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryText(
          text: label ?? '',
          fontSize: FontSizes.s14,
        ),
        TextFormField(
          onTap: onTap,
          readOnly: disable || onTap != null,
          controller: controller,
          focusNode: focusNode,
          validator: validator,
          obscureText: obscureText,
          maxLines: maxLines,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            prefixIcon: prefixIcon == null
                ? null
                : Icon(
                    prefixIcon,
                    color: AppColors.secondary,
                  ),
            suffixIcon: suffixIcon,
            focusColor: Colors.white,
            filled: true,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primary,
                width: Spacing.s2,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  Spacing.s4,
                ),
              ),
            ),
            errorText: errorText,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.inputBorder,
                width: 1,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  Spacing.s4,
                ),
              ),
            ),
            fillColor: Colors.white,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.inputBorder,
                width: 1,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  Spacing.s4,
                ),
              ),
            ),
            // labelText: 'Enter your username',
            hintText: placeholder,
            hintStyle: const TextStyle(
              color: AppColors.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
