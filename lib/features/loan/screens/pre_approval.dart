import 'package:first_bank_app/common_widgets/common_widgets.dart';
import 'package:first_bank_app/constants/constants.dart';
import 'package:first_bank_app/features/loan/screens/loan_eligibility_information.dart';
import 'package:first_bank_app/features/loan/screens/onboarding.dart';
import 'package:first_bank_app/features/loan/widgets/loan_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PreApproval extends StatelessWidget {
  const PreApproval({super.key});
  static const String routeName = '/pre-approval';

  @override
  Widget build(BuildContext context) {
    return PrimaryLayout(
      appBar: LoanAppBar(),
      child: Column(
        spacing: Spacing.s32,
        children: [
          PrimaryText(
            text: 'Congratulations, you have been pre-\napproved',
            fontSize: FontSizes.s18,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          SvgPicture.asset(
            Assets.congratulations,
          ),
          PrimaryText(
            text: 'You are eligible for 2,000,000 naira',
            fontSize: FontSizes.s16,
          ),
          Column(
            children: [
              PrimaryButton(
                label: 'Proceed',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    LoanEligibilityInformation.routeName,
                  );
                },
              ),
              SizedBox(
                height: Spacing.s16,
              ),
              SecondaryButton(
                label: 'Not Now',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Onboarding.routeName,
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
