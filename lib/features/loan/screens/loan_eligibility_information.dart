import 'package:first_bank_app/common_widgets/buttons/primary_button.dart';
import 'package:first_bank_app/common_widgets/inputs/primary_form_input.dart';
import 'package:first_bank_app/common_widgets/layouts/primary_layout.dart';
import 'package:first_bank_app/common_widgets/text/primary_text.dart';
import 'package:first_bank_app/common_widgets/text/secondary_text.dart';
import 'package:first_bank_app/constants/constants.dart';
import 'package:first_bank_app/features/loan/providers/loan_provider.dart';
import 'package:first_bank_app/features/loan/screens/document_upload.dart';
import 'package:first_bank_app/features/loan/util/input_utils.dart';
import 'package:first_bank_app/features/loan/widgets/loan_app_bar.dart';
import 'package:first_bank_app/features/loan/widgets/loan_request_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoanEligibilityInformation extends StatefulWidget {
  const LoanEligibilityInformation({super.key});
  static const String routeName = '/loan-eligibility-information';

  @override
  State<LoanEligibilityInformation> createState() =>
      _LoanEligibilityInformationState();
}

class _LoanEligibilityInformationState
    extends State<LoanEligibilityInformation> {
  final _formKey = GlobalKey<FormState>();
  final List<String> eligibilitySummary = [
    'You’re eligible to: N2,000,000.00',
    'Tenure: 24 Months',
    'Interest rate: 5%',
    'Management fees: 2%',
    'Credit Life Insurance fee: 2%',
  ];

  final List<String> tenures = ['12 Months', '24 Months', '36 Months'];
  String? tenure = '24 Months';

  @override
  Widget build(BuildContext context) {
    return PrimaryLayout(
      padding: EdgeInsets.zero,
      appBar: LoanAppBar(),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: Spacing.s16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoanRequestStepper(
                title: 'Loan Eligibility Information',
                subTitle:
                    'This is the maximum amount available to you. Please enter'
                    ' your desired loan amount below',
              ),
              Padding(
                padding: EdgeInsets.all(
                  Spacing.s16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: Spacing.s16,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PrimaryText(
                          text: 'Here\'s your loan eligibility summary',
                          fontSize: FontSizes.s18,
                        ),
                        SecondaryText(
                          text:
                              'Input your desired loan option from the summary',
                          fontSize: FontSizes.s12,
                        ),
                      ],
                    ),
                    Column(
                      children: eligibilitySummary.map(
                        (value) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: Spacing.s8,
                            ),
                            child: Row(
                              spacing: Spacing.s2,
                              children: [
                                Icon(
                                  Icons.check_outlined,
                                  color: Color(
                                    0xFFDFAC0F,
                                  ),
                                ),
                                SizedBox(
                                  width: Spacing.s8,
                                ),
                                PrimaryText(text: value),
                              ],
                            ),
                          );
                        },
                      ).toList(),
                    ),
                    PrimaryFormInput(
                      label: 'Loan Amount',
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        ThousandsSeparatorInputFormatter(),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter loan amount';
                        } else if (int.parse(
                              value.replaceAll(RegExp(r','), ''),
                            ) >
                            2000000) {
                          return 'Amount inputed exceeds maximum amount eligible.';
                        }
                        return null;
                      },
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: Spacing.s8,
                      children: [
                        PrimaryText(
                          text: 'Tenure',
                          fontSize: FontSizes.s14,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Spacing.s16,
                            vertical: Spacing.s4,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.inputBorder,
                              ),
                              borderRadius: BorderRadius.circular(
                                Spacing.s4,
                              ),
                              color: Colors.white),
                          child: DropdownButton<String>(
                            value: tenure,
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.inputBorder,
                            ),
                            hint: const SecondaryText(
                              text: 'Tenure',
                              fontSize: Spacing.s18,
                            ),
                            isExpanded: true,
                            elevation: Spacing.s16.toInt(),
                            style: const TextStyle(
                              color: AppColors.primary,
                            ),
                            borderRadius: BorderRadius.circular(
                              Spacing.s8,
                            ),
                            underline: Container(
                              height: 0,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                tenure = newValue;
                              });
                            },
                            items: tenures
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: Spacing.s16,
                      ),
                      child: PrimaryButton(
                        label: 'Proceed',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<LoanProvider>().nextStep(
                                  totalSteps: 3,
                                );

                            Navigator.pushNamed(
                              context,
                              DocumentUpload.routeName,
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
