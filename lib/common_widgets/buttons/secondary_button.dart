import 'package:flutter/material.dart';
import 'package:first_bank_app/constants/constants.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    this.onPressed,
    required this.label,
    this.disabled = false,
    this.loading = false,
    this.prefixIcon,
  });

  final void Function()? onPressed;
  final String label;
  final bool disabled;
  final bool loading;
  final Icon? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          Colors.transparent,
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Spacing.s4,
            ),
          ),
        ),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(
            vertical: Spacing.s20,
            horizontal: Spacing.s20,
          ),
        ),
        side: WidgetStateProperty.all<BorderSide>(
          BorderSide(
            color: AppColors.primary,
            width: Spacing.s2,
          ),
        ),
      ),
      onPressed: disabled || loading ? null : onPressed,
      child: loading
          ? const SizedBox(
              width: Spacing.s26,
              height: Spacing.s26,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: Spacing.s2,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (prefixIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(
                      right: Spacing.s8,
                    ),
                    child: prefixIcon!,
                  ),
                Text(
                  label,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: FontSizes.s16,
                  ),
                ),
              ],
            ),
    );
  }
}
