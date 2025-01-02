import 'package:first_bank_app/common_widgets/text/primary_text.dart';
import 'package:first_bank_app/common_widgets/text/secondary_text.dart';
import 'package:first_bank_app/constants/constants.dart';
import 'package:first_bank_app/features/loan/widgets/loan_app_bar.dart';
import 'package:first_bank_app/common_widgets/layouts/primary_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Onboarding extends StatelessWidget {
  Onboarding({super.key});

  final List<OnboardingItem> onboardingItems = [
    OnboardingItem(
      title: 'New Loan',
      description: 'Apply for a loan in minutes'
          ' with our easy, secure, and personalized financing options,'
          ' and get a decision in seconds',
      icon: SvgPicture.asset(
        Assets.moneyIcon,
      ),
    ),
    OnboardingItem(
      title: 'Active Loan',
      description: 'Your loan dashboard - track your progress and make'
          ' payments with ease',
      icon: SvgPicture.asset(
        Assets.activeLoanIcon,
      ),
    ),
    OnboardingItem(
      title: 'Account Maintenance',
      description: 'Apply for a loan in minutes'
          ' with our easy, secure, and personalized financing options,'
          ' and get a decision in seconds',
      icon: SvgPicture.asset(
        Assets.informationFillIcon,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PrimaryLayout(
      appBar: LoanAppBar(),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(
          Spacing.s24,
        ),
        child: Column(
          children: onboardingItems.map(
            (item) {
              return Column(
                children: [
                  SizedBox(
                    height: Spacing.s20,
                  ),
                  GestureDetector(
                    child: Column(
                      spacing: Spacing.s8,
                      children: [
                        Row(
                          spacing: Spacing.s8,
                          children: [
                            item.icon,
                            PrimaryText(
                              text: item.title,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                        SecondaryText(
                          text: item.description,
                          fontSize: FontSizes.s14,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Spacing.s20,
                  ),
                  Divider(
                    color: Color(
                      0xFFC5D9E7,
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final Widget icon;
  final String? route;

  const OnboardingItem({
    required this.title,
    required this.description,
    required this.icon,
    this.route,
  });
}
