import '../configs/nis.config.dart';

double nisPercentage({double totalPay, bool over_60}) =>
    over_60 ? 0 : totalPay / 100 * workerNis;
