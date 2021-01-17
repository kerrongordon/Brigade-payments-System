int totalWeekDayOfMonth({int year, int month, int day = 1}) {
  final totalDayOfMonth = totalDaysOfMonth(year, month);
  var result = 0;
  var tempDateTime = DateTime(year, month, day);
  for (var i = day; i <= totalDayOfMonth; i++) {
    tempDateTime = DateTime(tempDateTime.year, tempDateTime.month, i);
    if (tempDateTime.weekday == DateTime.saturday ||
        tempDateTime.weekday == DateTime.sunday) {
    } else {
      result++;
    }
  }
  return result;
}

int totalDaysOfMonth(int month, int year) {
  final result =
      (month < 12) ? DateTime(year, month + 1, 0) : DateTime(year + 1, 1, 0);
  return result.day;
}
