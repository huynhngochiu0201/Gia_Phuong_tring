import 'dart:io';

class Validoter {
  static String getString() {
    String value;
    value = stdin.readLineSync().toString().trim();
    return value;
  }
}
