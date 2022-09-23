import 'dart:io';

void main(List<String> args) {
  int i,x,y;
  for(i = 1; i <= 7; i++){
    for(x = 1; x <= 7-i; x++){
      stdout.write(" ");
    }
    for(y = 1; y <= i; y++){
      stdout.write("#");
    }
    print("\n");
  }
}