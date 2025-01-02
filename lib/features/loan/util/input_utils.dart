import 'package:flutter/services.dart';

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Remove all non-digit characters
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    // Handle backspace when there's only one character
    if (digitsOnly.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    // Format the number with comma separators
    final String formatted = _addThousandsSeparator(digitsOnly);

    // Calculate the new cursor position
    int cursorPosition = formatted.length;
    if (newValue.selection.start > 0) {
      cursorPosition =
          formatted.length - (newValue.text.length - newValue.selection.start);
      if (cursorPosition < 0) {
        cursorPosition = 0;
      } else if (cursorPosition > formatted.length) {
        cursorPosition = formatted.length;
      }
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }

  String _addThousandsSeparator(String value) {
    // Convert string to number and back to get the comma separators
    try {
      final int number = int.parse(value);
      return number.toString().replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (Match m) => '${m[1]},',
          );
    } catch (e) {
      return value;
    }
  }
}
