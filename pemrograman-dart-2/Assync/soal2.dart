void main(List<String> args) {
  print("Life");
  printNeverFlat(0, "never flat"). then((status){print(status);});
  print("is");
}

Future printNeverFlat(int seconds, String message){
  final duration = Duration(seconds: seconds);
  return Future.delayed(duration).then((value) => message);
}