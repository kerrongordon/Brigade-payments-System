import '../models/worker.model.dart';
import 'clearscreen-utils.dart';

void workersListInfor({List<Worker> workerList}) {
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
}
