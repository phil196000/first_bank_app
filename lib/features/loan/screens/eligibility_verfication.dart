import 'package:first_bank_app/common_widgets/layouts/primary_layout.dart';
import 'package:first_bank_app/features/loan/widgets/loan_app_bar.dart';
import 'package:first_bank_app/features/loan/widgets/loan_request_stepper.dart';
import 'package:flutter/material.dart';

class EligibilityVerfication extends StatelessWidget {
  const EligibilityVerfication({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryLayout(
      appBar: LoanAppBar(),
      child: Column(
        children: [
          LoanRequestStepper(),
        ],
      ),
    );
  }
}
