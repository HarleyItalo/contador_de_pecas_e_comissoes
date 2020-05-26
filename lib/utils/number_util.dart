import 'package:intl/intl.dart';

class NumberUtil {
  static String money(double number, {decimalDigits = 2}) {
    return NumberFormat.currency(
      locale: "pt_BR",
      symbol: " ",
      decimalDigits: decimalDigits,
    ).format(number);
  }
}
