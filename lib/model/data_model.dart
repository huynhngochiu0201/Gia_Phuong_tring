import 'dart:math';

class DataModel {
  static List<double>? gpt(double a, double b, double c) {
    // double delta = b * b - 4 * a * c;
    // if (a == 0) {
    //   if (b == 0) {
    //     return [];
    //   } else {
    //     return []; //'Phương trình có một nghiệm:x =${-c / b}'
    //   }
    // }

    // if (delta > 0) {
    //   double x1 = (-b + sqrt(delta)) / (2 * a);
    //   double x2 = (-b - sqrt(delta)) / (2 * a);
    //   return [x1,x2]; //"Phương trình có hai nghiệm: x1 = ${x1.toStringAsFixed(2)}, x2 = ${x2.toStringAsFixed(2)} "
    // } else if (delta == 0) {
    //   double x = -b / (2 * a);
    //   return [x]; //"Phương trình có nghiệm kép: x = ${x.toStringAsFixed(2)}"
    // } else {
    //   return []; //'Phương trình vô số nghiệm'
    // }

    if (a == 0 && b == 0 && c == 0) {
      return null;
    }
    if (a == 0 && b == 0 && c == 0) {
      return [];
    }
    if (a == 0 && b == 0) {
      return [-c / b];
    }
    double delta = b * b - 4 * a * c;

    if (delta == 0) {
      return [-b / (2 * a)];
    }
    if (delta > 0) {
      double x1 = (-b + sqrt(delta)) / (2 * a);
      double x2 = (-b - sqrt(delta)) / (2 * a);
      return [x1, x2];
    }
    return [];
  }
}
