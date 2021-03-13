import '../configs/nis.config.dart';

double nidDeductions({double totalPay, bool over_60}) {
  if (over_60 == null) {
    return totalPay / 100 * workerNisDeduction;
  }
  return over_60 ? totalPay / 100 * 1 : totalPay / 100 * workerNisDeduction;
}
