import 'dart:io';

class segitiga{
  late double setengah, alas, tinggi;
  get luasSegitiga => setengah * alas * tinggi;
}

void main(List<String> args) {
  segitiga s1 = new segitiga();

  s1.setengah = 0.5;
  s1.alas = 20.0;
  s1.tinggi = 30.0;

  stdout.write("Luas segitiga adalah : ");
  stdout.write(s1.luasSegitiga);
}

