import 'package:first_bank_app/common_widgets/text/primary_text.dart';
import 'package:first_bank_app/constants/constants.dart';
import 'package:first_bank_app/features/loan/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoanAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LoanAppBar({
    super.key,
    this.showCloseButton = false,
    this.disableBackButton = false,
  });
  final bool showCloseButton;
  final bool disableBackButton;

  @override
  Widget build(BuildContext context) {
    final double totalHeight =
        kToolbarHeight + MediaQuery.of(context).padding.top + Spacing.s20;

    return Container(
      height: totalHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Color(
              0xFFF2F4F7,
            ),
          ),
        ),
      ),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Spacing.s16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (showCloseButton) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Onboarding();
                      },
                    ),
                  );
                } else if (!disableBackButton) {
                  Navigator.of(context).pop();
                }
              },
              child: Container(
                padding: EdgeInsets.all(
                  Spacing.s8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Spacing.s4,
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(
                        alpha: 0.25,
                      ),
                      offset: Offset(
                        0,
                        4,
                      ),
                      blurRadius: Spacing.s74,
                    ),
                  ],
                ),
                child: Icon(
                  showCloseButton ? Icons.close : Icons.arrow_back,
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    Spacing.s60,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(
                        alpha: 0.05,
                      ),
                      offset: Offset(
                        Spacing.s4,
                        5,
                      ),
                      blurRadius: Spacing.s10,
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: Spacing.s12,
                  vertical: Spacing.s8,
                ),
                child: Row(
                  spacing: Spacing.s4,
                  children: [
                    SvgPicture.asset(
                      Assets.supportIcon,
                      width: Spacing.s20,
                      height: Spacing.s20,
                    ),
                    PrimaryText(
                      text: 'Need help?',
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
        kToolbarHeight + Spacing.s20,
      );
}
