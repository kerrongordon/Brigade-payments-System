import '../configs/nis.config.dart';

double payBack({double salary, double workerIncome}) =>
    salary - (salary / 100 * workerNis) - workerIncome;
