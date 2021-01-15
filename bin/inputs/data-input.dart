import 'dart:io';

String dataInput({String message}) {
  var data = '';
  while (data.isEmpty) {
    print('$message \n');
    data = stdin.readLineSync();
    print('');
  }
  return data;
}
