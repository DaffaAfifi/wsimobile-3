import 'dart:io';

void main(List<String> args) {
  int i,x;
  for(i = 1; i <= 7; i ++){
    for(x = 1; x <= i; x++){
      stdout.write("#");
    }
    print("\n");
  }
}