import 'package:first_bank_app/constants/constants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
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
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          AppColors.primary,
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
        elevation: WidgetStateProperty.all<double>(0.0),
      ),
      onPressed: disabled || loading ? null : onPressed,
      child: loading
          ? const SizedBox(
              width: Spacing.s24,
              height: Spacing.s24,
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
                    padding: const EdgeInsets.only(right: 8.0),
                    child: prefixIcon!,
                  ),
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: Spacing.s16,
                  ),
                ),
              ],
            ),
    );
  }
}
