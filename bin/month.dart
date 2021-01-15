import 'dart:io';

import 'models/month.model.dart';
import 'utils/clearscreen-utils.dart';

Month month() {
  final month = Month();
  print('Enther Month Name');
  month.month_name = stdin.readLineSync();
  print('');
  print('Enther Total Work Days for the Month of ${month.month_name}');
  month.total_work_day = int.parse(stdin.readLineSync());
  print('');
  clearscreen();
  return month;
}
