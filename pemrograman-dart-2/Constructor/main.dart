import 'dart:math';

import 'employee.dart';

void main(List<String> args) {
  employee e1 = new employee();
  e1.id = "E41210089";
  e1.name = "Daffa Afifi Syahrony";
  e1.departement = "Information Technology";

  print("Hello my name is " + e1.name +", my id is " + e1.id + ", iam from " + e1.departement + " departement, nice to meet y'all");
}