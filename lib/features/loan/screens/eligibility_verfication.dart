import 'package:first_bank_app/common_widgets/common_widgets.dart';
import 'package:first_bank_app/constants/constants.dart';
import 'package:first_bank_app/features/loan/widgets/loan_app_bar.dart';
import 'package:first_bank_app/features/loan/widgets/loan_request_stepper.dart';
import 'package:flutter/material.dart';

class EligibilityVerfication extends StatelessWidget {
  const EligibilityVerfication({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryLayout(
      padding: EdgeInsets.zero,
      appBar: LoanAppBar(),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: Spacing.s16,
        ),
        child: Column(
          spacing: Spacing.s16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoanRequestStepper(
              title: 'Eligibility Verification',
              subTitle:
                  'This check list must be validated in order to get a loan'
                  ' decision.',
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Spacing.s16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryText(
                    text: 'Get a Personalized Loan Solution \nin Minutes',
                    fontSize: FontSizes.s20,
                    fontWeight: FontWeight.w500,
                  ),
                  SecondaryText(
                    text: 'Proceed to check your eligibility amount',
                    fontSize: FontSizes.s12,
                  ),
                  SizedBox(
                    height: Spacing.s32,
                  ),
                  PrimaryButton(
                    label: 'Check Your Eligibility',
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: Spacing.s16,
                  ),
                  SecondaryButton(
                    label: 'Not Now',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
