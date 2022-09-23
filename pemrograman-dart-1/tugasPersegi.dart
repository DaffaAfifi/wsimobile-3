import 'dart:io';
import 'package:test/expect.dart';

void main(List<String> args) {
  int i,x;
  for(i = 1; i <= 4; i++){
    for(x = 1; x <= 8; x++){
      stdout.write("#");
    }
    print("\n");
  }
}