import 'package:first_bank_app/common_widgets/buttons/secondary_button.dart';
import 'package:first_bank_app/common_widgets/layouts/primary_layout.dart';
import 'package:first_bank_app/common_widgets/text/primary_text.dart';
import 'package:first_bank_app/constants/constants.dart';
import 'package:first_bank_app/features/loan/screens/onboarding.dart';
import 'package:first_bank_app/features/loan/widgets/loan_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ApplicationSuccess extends StatelessWidget {
  const ApplicationSuccess({super.key});
  static const String routeName = '/application-success';

  @override
  Widget build(BuildContext context) {
    return PrimaryLayout(
      appBar: LoanAppBar(
        showCloseButton: true,
      ),
      child: Column(
        children: [
          SizedBox(
            height: Spacing.s100,
          ),
          PrimaryText(
            text: 'Loan Application Successful',
            fontWeight: FontWeight.w700,
            fontSize: FontSizes.s24,
          ),
          SvgPicture.asset(
            Assets.wallet,
          ),
          PrimaryText(
            text: 'Once your loan with ID: 2087 is reviewed and'
                ' approved, the funds will be credited to your account xxxxxx',
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(
            height: Spacing.s64,
          ),
          SecondaryButton(
            label: 'Track Application',
            onPressed: () {
              // TODO: Navigate to track application screen when implemented
              Navigator.pushNamed(
                context,
                Onboarding.routeName,
              );
            },
          ),
        ],
      ),
    );
  }
}
