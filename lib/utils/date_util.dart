import 'package:intl/intl.dart';

class DateUtil {
  static String formatData(value, {format = "yyyy-MM-dd"}) {
    if (value == null) {
      return value;
    }
    value = value.toString();
    var date = DateTime.tryParse(value);

    if (date != null) {
      var formatter = new DateFormat(format);

      value = formatter.format(date);
    }
    return value;
  }

  static int dayOfWeek(String date) {
    var value = DateTime.tryParse(date);
    return value.weekday;
  }
}
