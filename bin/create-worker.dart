import 'core/nis-deductions.dart';
import 'core/nis-percentage.dart';
import 'core/pay-back.dart';
import 'core/total-pay.dart';
import 'core/worker-Income.dart';
import 'inputs/data-input.dart';
import 'models/month.model.dart';
import 'models/worker.model.dart';
import 'utils/worker-infor.dart';

List<Worker> createWorker({Month month}) {
  final workerList = <Worker>[];

  while (true) {
    final worker = Worker();

    workersListInfor(workerList: workerList);

    worker.frist_name = dataInput(message: 'Enther Worker Frist Name');
    if (worker.frist_name.toLowerCase() == 'done') {
      break;
    }

    worker.last_name =
        dataInput(message: 'Enther ${worker.frist_name} Last Name');
    if (worker.last_name.toLowerCase() == 'done') {
      break;
    }

    final fullmonth = dataInput(
        message:
            'Did ${worker.frist_name} ${worker.last_name} work for the Full Month of ${month.month_name} ${month.year} (Y)es (N)o');
    if (fullmonth.toString().toLowerCase() == 'done') {
      break;
    }
    if (fullmonth.toLowerCase() == 'y' || fullmonth.toLowerCase() == 'yes') {
      worker.days_work = month.total_work_day;
    } else {
      worker.days_work = int.parse(dataInput(
          message:
              'How manny days did ${worker.frist_name} ${worker.last_name} work for the Month of ${month.month_name}'));
      if (worker.days_work.toString().toLowerCase() == 'done') {
        break;
      }
    }

    while (worker.days_work > month.total_work_day || worker.days_work < 0) {
      worker.days_work = int.parse(dataInput(
          message:
              'There are only ${month.total_work_day} working days in the month of ${month.month_name} how manny days did ${worker.frist_name} ${worker.last_name} work for the Month of ${month.month_name}'));
      if (worker.days_work.toString().toLowerCase() == 'done') {
        break;
      }
    }

    worker.salary = double.parse(dataInput(
        message: 'What is ${worker.frist_name} ${worker.last_name} Salary'));
    if (worker.salary.toString().toLowerCase() == 'done') {
      break;
    }

    final over_60 = dataInput(
        message:
            'Is ${worker.frist_name} ${worker.last_name} Over the age of 60 (Y)es or (N)o');
    if (over_60.toLowerCase() == 'done') {
      break;
    }

    over_60.toLowerCase() == 'yes' || over_60.toLowerCase() == 'y'
        ? worker.over_60 = true
        : worker.over_60 = false;

    worker.total_Pay = totalPay(
      salary: worker.salary,
      monthDays: month.total_work_day,
      workerDays: worker.days_work,
    ).round();

    worker.nis_Deductions = nidDeductions(
      totalPay: worker.total_Pay.toDouble(),
      over_60: worker.over_60,
    ).round();

    worker.nis_Percentage = nisPercentage(
      totalPay: worker.total_Pay.toDouble(),
      over_60: worker.over_60,
    ).round();

    worker.worker_Income = workerIncome(
      totalPay: worker.total_Pay.toDouble(),
      nisPercentage: worker.nis_Percentage.toDouble(),
    ).round();

    worker.payBack = payBack(
      salary: worker.salary,
      workerIncome: worker.worker_Income.toDouble(),
    ).round();

    if (worker.frist_name != null ||
        worker.last_name != null ||
        worker.over_60 != null ||
        worker.salary != null) {
      workerList.add(worker);
    }
  }

  return workerList;
}
