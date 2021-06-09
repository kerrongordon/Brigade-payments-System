int totalWeekDayOfMonth({int year, int month, int firstday = 1}) {
  final totalDays = _totalDaysOfMonth(month, year);

  final startDate = DateTime(year, month, firstday);
  final endDate = DateTime(year, month, totalDays);

  final nbDays = endDate.difference(startDate).inDays + 1;

  final days = List<int>.generate(nbDays, (index) {
    final weekDay =
        DateTime(startDate.year, startDate.month, startDate.day + (index))
            .weekday;
    if (weekDay != DateTime.saturday && weekDay != DateTime.sunday) {
      return 1;
    }
    return 0;
  });

  return days.reduce((a, b) => a + b);
}

int _totalDaysOfMonth(int month, int year) {
  final result =
      (month < 12) ? DateTime(year, month + 1, 0) : DateTime(year + 1, 1, 0);
  return result.day;
}
