import 'package:first_bank_app/common_widgets/buttons/primary_button.dart';
import 'package:first_bank_app/common_widgets/layouts/primary_layout.dart';
import 'package:first_bank_app/constants/constants.dart';
import 'package:first_bank_app/features/loan/providers/loan_provider.dart';
import 'package:first_bank_app/features/loan/screens/application_success.dart';
import 'package:first_bank_app/features/loan/widgets/loan_app_bar.dart';
import 'package:first_bank_app/features/loan/widgets/loan_request_stepper.dart';
import 'package:first_bank_app/features/loan/widgets/upload_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DocumentUpload extends StatefulWidget {
  const DocumentUpload({super.key});
  static const routeName = '/document-upload';
  @override
  State<DocumentUpload> createState() => _DocumentUploadState();
}

class _DocumentUploadState extends State<DocumentUpload> {
  @override
  Widget build(BuildContext context) {
    return PrimaryLayout(
      padding: EdgeInsets.zero,
      appBar: LoanAppBar(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            LoanRequestStepper(
              title: 'Upload Documents',
              subTitle: 'To finish your application, kindly upload the'
                  ' requested document.',
            ),
            Padding(
              padding: EdgeInsets.all(
                Spacing.s16,
              ),
              child: Column(
                spacing: Spacing.s24,
                children: [
                  UploadCard(
                    title: 'Valid ID Card',
                    description: 'Kindly upload a clear document of one of '
                        'your Valid Id card listed here: Voter\'s Card, '
                        'Driver\'s License, International Passport',
                  ),
                  UploadCard(
                    title: 'Letter of Salary Domiciliation',
                    description: 'Kindly upload a clear document of your'
                        ' letter of salary domiciliation',
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: Spacing.s32,
                    ),
                    child: PrimaryButton(
                      label: 'Proceed',
                      onPressed: () {
                        final idCard = context.read<LoanProvider>().idCard;
                        final letterOfSalaryDomiciliation = context
                            .read<LoanProvider>()
                            .letterOfSalaryDomiciliation;

                        if (idCard != null &&
                            letterOfSalaryDomiciliation != null) {
                          Navigator.pushNamed(
                            context,
                            ApplicationSuccess.routeName,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Please upload all documents',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                    ),
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
