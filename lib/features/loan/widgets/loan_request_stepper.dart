import 'package:first_bank_app/common_widgets/text/primary_text.dart';
import 'package:first_bank_app/common_widgets/text/secondary_text.dart';
import 'package:first_bank_app/constants/app_colors.dart';
import 'package:first_bank_app/constants/constants.dart';
import 'package:flutter/material.dart';

class LoanRequestStepper extends StatelessWidget {
  LoanRequestStepper({
    super.key,
    this.title,
    this.subTitle,
  });
  final String? title;
  final String? subTitle;
  final List<String> steps = ['A', 'B', 'C', 'D', 'E'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        spacing: Spacing.s16,
        children: [
          Row(
            children: [
              LoanRequestStepperItem(
                label: 'A',
              ),
              LoanRequestStepperItem(
                label: 'B',
                isCompleted: true,
              ),
            ],
          ),
          PrimaryText(
            text: title ?? '',
            fontWeight: FontWeight.w600,
          ),
          SecondaryText(text: subTitle ?? ''),
        ],
      ),
    );
  }
}

class LoanRequestStepperItem extends StatelessWidget {
  const LoanRequestStepperItem({
    super.key,
    required this.label,
    this.isCompleted = false,
  });
  final String label;
  final bool isCompleted;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: Spacing.s10,
          height: 3,
          decoration: BoxDecoration(
            color: AppColors.primary,
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: Spacing.s32,
          height: Spacing.s32,
          decoration: BoxDecoration(
            color: isCompleted ? AppColors.primary : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.primary,
              width: 1,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: !isCompleted ? AppColors.primary : Colors.white,
              fontSize: FontSizes.s14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          width: Spacing.s10,
          height: 3,
          decoration: BoxDecoration(
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
