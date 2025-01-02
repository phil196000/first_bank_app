import 'package:first_bank_app/common_widgets/text/primary_text.dart';
import 'package:first_bank_app/common_widgets/text/secondary_text.dart';
import 'package:first_bank_app/constants/constants.dart';
import 'package:first_bank_app/features/loan/providers/loan_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final currentStep =
        context.select((LoanProvider state) => state.currentStep);
    return Container(
      padding: EdgeInsets.all(
        Spacing.s16,
      ),
      decoration: BoxDecoration(
        color: AppColors.secondary,
      ),
      child: Column(
        spacing: Spacing.s16,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: steps.map(
              (step) {
                return LoanRequestStepperItem(
                  label: step,
                  isCompleted: steps.indexOf(step) <= currentStep,
                  hideLastDivider: steps.indexOf(step) == steps.length - 1,
                  isActive: steps.indexOf(step) <= currentStep + 1,
                  isFirst: steps.indexOf(step) == 0,
                );
              },
            ).toList(),
          ),
          PrimaryText(
            text: title ?? '',
            fontWeight: FontWeight.w600,
          ),
          SecondaryText(
            text: subTitle ?? '',
          ),
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
    this.hideLastDivider = false,
    this.isActive = false,
    this.isFirst = false,
  });
  final String label;
  final bool isCompleted;
  final bool hideLastDivider;
  final bool isActive;
  final bool isFirst;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isFirst)
          Container(
            width: Spacing.s10,
            height: 3,
            decoration: BoxDecoration(
              color: isActive
                  ? AppColors.primary
                  : Color(
                      0xFFA6BBCA,
                    ),
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
        if (!hideLastDivider)
          Container(
            width: Spacing.s20,
            height: 3,
            decoration: BoxDecoration(
              color: isActive
                  ? AppColors.primary
                  : Color(
                      0xFFA6BBCA,
                    ),
            ),
          ),
      ],
    );
  }
}
