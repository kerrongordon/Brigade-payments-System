import 'dart:io';

import 'core/nis-deductions.dart';
import 'core/nis-percentage.dart';
import 'core/pay-back.dart';
import 'core/total-pay.dart';
import 'core/worker-Income.dart';
import 'models/month.model.dart';
import 'models/worker.model.dart';
import 'utils/clearscreen-utils.dart';

List<Worker> createWorker({Month month}) {
  final workerList = <Worker>[];
  while (true) {
    final worker = Worker();

    if (workerList.isEmpty) {
      print('-------------------------------------------------------------');
      print('Enter Workers Information Once Completed just type ( done )');
      print('-------------------------------------------------------------');
      print('');
    }

    if (workerList.isNotEmpty) {
      clearscreen();
      print('Once Completed just type ( done ) \n');
      print('####################################');
      print('');
      print('~~~~~~~~~~~~~~~~ Workers List ~~~~~~~~~~~~~~~~~~~~');
      for (final worker in workerList) {
        print('${worker.frist_name} ${worker.last_name} Added');
      }
      print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
      print('');
    }

    print('Enther Worker Frist Name \n');
    worker.frist_name = stdin.readLineSync();
    if (worker.frist_name.toLowerCase() == 'done') {
      break;
    }
    print('');

    print('Enther ${worker.frist_name} Last Name \n');
    worker.last_name = stdin.readLineSync();
    if (worker.last_name.toLowerCase() == 'done') {
      break;
    }
    print('');

    print(
        'How manny days did ${worker.frist_name} ${worker.last_name} work in the Month of ${month.month_name} \n');
    worker.days_work = int.parse(stdin.readLineSync());
    if (worker.days_work.toString().toLowerCase() == 'done') {
      break;
    }
    print('');

    print('What is ${worker.frist_name} ${worker.last_name} Salary \n');
    worker.salary = double.parse(stdin.readLineSync());
    if (worker.salary.toString().toLowerCase() == 'done') {
      break;
    }
    print('');

    print(
        'Is ${worker.frist_name} ${worker.last_name} Over the age of 60 (YES or NO) \n');
    final over_60 = stdin.readLineSync();
    if (over_60.toLowerCase() == 'done') {
      break;
    }
    print('');

    over_60.toLowerCase() == 'yes'
        ? worker.over_60 = true
        : worker.over_60 = false;

    worker.total_Pay = totalPay(
      salary: worker.salary,
      monthDays: month.total_work_day,
      workerDays: worker.days_work,
    ).round();

    worker.nis_Deductions = nidDeductions(
      totalPay: worker.total_Pay.toDouble(),
    ).round();

    worker.nis_Percentage = nisPercentage(
      totalPay: worker.total_Pay.toDouble(),
    ).round();

    worker.worker_Income = workerIncome(
      totalPay: worker.total_Pay.toDouble(),
      nisPercentage: worker.nis_Percentage.toDouble(),
    ).round();

    worker.payBack = payBack(
      salary: worker.salary,
      workerIncome: worker.worker_Income.toDouble(),
    ).round();

    if (worker.salary != null) {
      workerList.add(worker);
    }
  }
  return workerList;
}
