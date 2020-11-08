import 'package:intl/intl.dart';

import 'date_formats.dart';

extension DateTimeExtensions on DateTime {
  String toFormattedString(String pattern) => DateFormat(pattern).format(this);

  String get weekDay => toFormattedString(DateFormats.WEEKDAY);

  String get abbrThreeWeekDay =>
      toFormattedString(DateFormats.ABBR_THREE_WEEKDAY);
}
