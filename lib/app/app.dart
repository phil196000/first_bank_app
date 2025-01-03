import 'package:first_bank_app/app/providers.dart';
import 'package:first_bank_app/features/loan/screens/application_success.dart';
import 'package:first_bank_app/features/loan/screens/document_upload.dart';
import 'package:first_bank_app/features/loan/screens/eligibility_verfication.dart';
import 'package:first_bank_app/features/loan/screens/loan_eligibility_information.dart';
import 'package:first_bank_app/features/loan/screens/onboarding.dart';
import 'package:first_bank_app/features/loan/screens/pre_approval.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      // TODO: update to use GoRouter
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Onboarding(),
          EligibilityVerfication.routeName: (context) =>
              EligibilityVerfication(),
          PreApproval.routeName: (context) => PreApproval(),
          LoanEligibilityInformation.routeName: (context) =>
              LoanEligibilityInformation(),
          DocumentUpload.routeName: (context) => DocumentUpload(),
          ApplicationSuccess.routeName: (context) => ApplicationSuccess(),
        },
        title: 'First Bank App',
        theme: ThemeData(
          useMaterial3: true,
        ),
      ),
    );
  }
}
