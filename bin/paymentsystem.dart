import 'core/full-payback-withnis.dart';
import 'core/nis-deductions.dart';
import 'create-worker.dart';
import 'month.dart';
import 'utils/clearscreen-utils.dart';
import 'welcome.dart';

void main(List<String> arguments) {
  clearscreen();
  welcomeMassage();

  final monthInfor = month();
  final workersList = createWorker(month: monthInfor);

  clearscreen();

  if (workersList.isNotEmpty) {
    for (final worker in workersList) {
      print('~~~~~~~~~~~ ${worker.frist_name} ${worker.last_name} ~~~~~~~~~~~');
      print('Total Pay: ${worker.total_Pay}');
      print('NIS Deductions: ${worker.nis_Deductions}');
      print('Worker Income: ${worker.worker_Income}');
      print('Pay Back: ${worker.payBack}');
      print('NIS 5%: ${worker.nis_Percentage}');
      print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n');
    }
    print('');
  }

  var salaryTotal = workersList.map((e) => e.salary).reduce((a, b) => a + b);
  var fullNispayment = nidDeductions(totalPay: salaryTotal).round();
  var payBackTotal = workersList.map((e) => e.payBack).reduce((a, b) => a + b);
  var nisTotal =
      workersList.map((e) => e.nis_Deductions).reduce((a, b) => a + b);

  var fullPaybackNis = fullPaybackWithNis(
    fullNispayment: fullNispayment,
    nisTotal: nisTotal,
    payBackTotal: payBackTotal,
  );

  print('++++++++++++++++++++++++++++++++++++++++++++++++++');
  print('Total Pay Back $fullPaybackNis');
  print('NIS $nisTotal');
  print('++++++++++++++++++++++++++++++++++++++++++++++++++');
}
