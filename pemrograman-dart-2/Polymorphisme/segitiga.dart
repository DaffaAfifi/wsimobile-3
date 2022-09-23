import 'bangun_datar.dart';

class segitiga extends bangun_datar{
  late double _alas, _tinggi, _a, _b;

  void set alas(double value){
    if(value < 0){
      value *= -1;
    }
    _alas = value;
  }

  double get alas{
    return _alas;
  }

  void set tinggi(double value){
    if(value < 0){
      value *= -1;
    }
    _tinggi = value;
  }

  double get tinggi{
    return _tinggi;
  }

  void set a(double value){
    if(value < 0){
      value *= -1;
    }
    _a = value;
  }

  double get a{
    return _a;
  }

  void set b(double value){
    if(value < 0){
      value *= -1;
    }
    _b = value;
  }

  double get b{
    return _b;
  }

  double get luas => 0.5 * _alas * _tinggi;
  double get keliling => _a + _b + _alas;
}