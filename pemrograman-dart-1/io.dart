import 'dart:io';
void main(List<String> args) {
  print("Masukkan Password: ");
  String inputText = stdin.readLineSync()!;
  print("Password: ${inputText}");
}