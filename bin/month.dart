import 'dart:io';

import 'package:intl/intl.dart';

import 'core/month-weekday.dart';
import 'models/month.model.dart';
import 'utils/clearscreen-utils.dart';

Month month() {
  final month = Month();
  print('Enther Month Number EXAMPLE ( 1 ) for January');
  month.month = int.parse(stdin.readLineSync());
  print('');
  print('Enther year');
  month.year = int.parse(stdin.readLineSync());
  print('');

  month.month_name =
      DateFormat('MMMM').format(DateTime(month.year, month.month));

  var weekDayOfMonth =
      totalWeekDayOfMonth(month: month.month, year: month.year);

  month.total_work_day = weekDayOfMonth;
  print('');
  clearscreen();
  print(
      'There are ${weekDayOfMonth.toString()} Work Days in the Month of ${month.month_name} ${month.year}');
  return month;
}
