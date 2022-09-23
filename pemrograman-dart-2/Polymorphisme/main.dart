import 'dart:io';
import 'lingkaran.dart';
import 'bangun_datar.dart';
import 'persegi.dart';
import 'segitiga.dart';

void main(List<String> args) {
  lingkaran l1 = new lingkaran();
  bangun_datar bt1 = new bangun_datar();
  l1.r = 14;
  bt1.luas = l1.luas;
  bt1.keliling = l1.keliling;
  stdout.write("Luas lingkaran adalah : ");
  stdout.write(bt1.luas);
  stdout.write(" Sedangkan kelilingnya adalah : ");
  stdout.write(bt1.keliling);

  print("\n");

  persegi psg1 = new persegi();
  bangun_datar bt2 = new bangun_datar();
  psg1.sisi = 20;
  bt2.luas = psg1.luas;
  bt2.keliling = psg1.keliling;
  stdout.write("Luas persegi adalah : ");
  stdout.write(bt2.luas);
  stdout.write(" Sedangkan kelilingnya adalah : ");
  stdout.write(bt2.keliling);

  print("\n");

  segitiga stg1 = new segitiga();
  bangun_datar bt3 = new bangun_datar();
  stg1.alas = 20;
  stg1.tinggi = 30;
  stg1.a = 10;
  stg1.b = 10;
  bt3.luas = stg1.luas;
  bt3.keliling = stg1.keliling;
  stdout.write("Luas segitiga adalah : ");
  stdout.write(bt3.luas);
  stdout.write(" Sedangkan kelilingnya adalah : ");
  stdout.write(bt3.keliling);
  }