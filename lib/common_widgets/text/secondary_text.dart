import 'package:first_bank_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SecondaryText extends StatelessWidget {
  const SecondaryText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.fontWeight,
    this.textAlign,
    this.overflow,
    this.color,
  });

  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        color: color ?? AppColors.secondaryText,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
