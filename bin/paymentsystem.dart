import 'create-worker.dart';
import 'month.dart';
import 'welcome.dart';

void main(List<String> arguments) {
  welcomeMassage();

  final monthInfor = month();
  final workersList = createWorker(month: monthInfor);

  if (workersList.isNotEmpty) {
    for (final worker in workersList) {
      print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
      print('frist Name: ${worker.frist_name}');
      print('Last Name: ${worker.last_name}');
      print('Total Pay: ${worker.total_Pay}');
      print('NIS Deductions: ${worker.nis_Deductions}');
      print('Worker Income: ${worker.worker_Income}');
      print('Pay Back: ${worker.payBack}');
      print('NIS 5%: ${worker.nis_Percentage}');
      print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
    }
    print('');
  }

  var payBackTotal = workersList.map((e) => e.payBack).reduce((a, b) => a + b);
  var nisTotal =
      workersList.map((e) => e.nis_Deductions).reduce((a, b) => a + b);

  print(payBackTotal);
  print(nisTotal);
}
