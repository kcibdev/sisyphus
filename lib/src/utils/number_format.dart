import 'package:intl/intl.dart';

String formatCurrency(double amount, {int decimal = 2}) {
  String currencyFormatted = NumberFormat.currency(
          locale: "en_US", symbol: "\$", decimalDigits: decimal)
      .format(amount);

  return currencyFormatted;
}
