import 'dart:io';

import 'package:intl/intl.dart';

import 'core/month-weekday.dart';
import 'inputs/data-input.dart';
import 'models/month.model.dart';
import 'utils/clearscreen-utils.dart';

Month month() {
  final month = Month();
  final dateTime = DateTime.now();
  final thisMonth = DateFormat('MMMM', 'en_US').format(dateTime);

  while (month.month == null) {
    final isThisMonth =
        dataInput(message: 'Payment For The Month Of $thisMonth (Y)es or (N)o')
            .toLowerCase();

    if (isThisMonth == 'yes' || isThisMonth == 'y') {
      month.month = dateTime.month;
      print('Payments for $thisMonth');
      print('');
    } else if (isThisMonth == 'no' || isThisMonth == 'n') {
      print('Enther Month Number EXAMPLE ( 1 ) for January');
      month.month = int.parse(stdin.readLineSync());
      print(
          'Payments for ${DateFormat('MMMM').format(DateTime(dateTime.year, month.month))}');
      print('');
    } else {
      clearscreen();
      month.month = null;
    }
  }

  while (month.year == null) {
    final isthisYear = dataInput(
            message: 'Payment For The Year ${dateTime.year} (Y)es or (N)o')
        .toLowerCase();

    if (isthisYear == 'yes' || isthisYear == 'y') {
      month.year = dateTime.year;
      print('Payments for $thisMonth ${dateTime.year}');
      print('');
    } else if (isthisYear == 'no' || isthisYear == 'n') {
      print('Enther year');
      month.year = int.parse(stdin.readLineSync());
      print('Payments for $thisMonth ${month.year}');
      print('');
    } else {
      clearscreen();
      month.year = null;
    }
  }

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
