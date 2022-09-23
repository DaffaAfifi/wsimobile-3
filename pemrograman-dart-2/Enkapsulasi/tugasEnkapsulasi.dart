import 'dart:io';

import 'lingkaranEnkapsulasi.dart';

void main(List<String> args) {
  lingkaran l1 = new lingkaran();

  l1.r = -14;

  stdout.write("Luas lingkaran adalah : ");
  stdout.write(l1.luas);
}