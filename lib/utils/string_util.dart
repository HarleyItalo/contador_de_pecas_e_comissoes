import 'package:intl/intl.dart';

class StringUtil {
  static String onlyNumbers(String value) {
    if (value == null) {
      return "";
    }
    return value.replaceAll(RegExp('[a-zA-Z.-/-]'), '');
  }

  static String formatData(value, {format = "dd/MM/yyyy"}) {
    if (value == null) {
      return value;
    }
    var date = DateTime.tryParse(value);
    if (date != null) {
      var formatter = new DateFormat(format);

      value = formatter.format(date);
    }
    return value;
  }

  static double parseStringToDouble(String value) {
    if (value == null || value.isEmpty) {
      return 0.0;
    }
    var data = double.parse(
      value.replaceAll('.', '').replaceAll(',', '.'),
    );
    return data;
  }

  static bool emailIsValid(String email) {
    return email == null || !email.contains("@") || !email.contains(".");
  }

  static bool isNullOrEmpty(String value, {int minLenght = 2}) {
    if (value == null) {
      return true;
    }
    return value.length < minLenght;
  }
}
