import 'package:first_bank_app/app/providers.dart';
import 'package:first_bank_app/features/loan/screens/eligibility_verfication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: MaterialApp(
        title: 'First Bank App',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: EligibilityVerfication(),
      ),
    );
  }
}