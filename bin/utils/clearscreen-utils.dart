import 'dart:io';

void clearscreen() {
  print(Process.runSync('clear', [], runInShell: true).stdout);
}
