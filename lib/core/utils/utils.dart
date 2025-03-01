import 'package:intl/intl.dart';

class Formatter {
  // Currency formatter
  static String currency(double amount, {String symbol = '₹', int decimalPlaces = 2}) {
    final formatter = NumberFormat.currency(
      symbol: symbol,
      decimalDigits: decimalPlaces,
    );
    return formatter.format(amount);
  }

  // Number formatter with commas
  static String number(num number, {int decimalPlaces = 2}) {
    final formatter = NumberFormat.decimalPattern()
      ..minimumFractionDigits = 0
      ..maximumFractionDigits = decimalPlaces;
    return formatter.format(number);
  }

  // Percentage formatter
  static String percentage(double value, {int decimalPlaces = 1}) {
    final formatter = NumberFormat.percentPattern()..maximumFractionDigits = decimalPlaces;
    return formatter.format(value / 100);
  }

  // Date formatter
  static String date(DateTime date, {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  // Month short name (e.g. "Jan", "Feb")
  static String monthShort(int month) {
    if (month < 1 || month > 12) return '';
    return DateFormat('MMM').format(DateTime(2022, month, 1));
  }

  // Truncate long text with ellipsis
  static String truncateWithEllipsis(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }
}
