import 'dart:io';

void main(List<String> args) {
  print("Apakah anda akan menginstall aplikasi Dart? (y/t)");
  String inputText = stdin.readLineSync()!;
  if (inputText == "Y" || inputText == "y"){
    print("Anda akan menginstall aplikasi dart");
  }else{
    print("aborted");
  }
}