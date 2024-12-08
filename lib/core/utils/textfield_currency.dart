import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

/// A reusable class for formatting numbers as Rupiah currency
class CurrencyFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // If input is empty, return as is
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Remove any non-numeric characters
    final numericString = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Format as currency
    final formattedText = _formatter.format(int.parse(numericString));

    // Return formatted value while maintaining cursor position
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
