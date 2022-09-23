import 'bangun_datar.dart';

class persegi extends bangun_datar{
  late double _sisi;

  void set sisi(double value){
    if(value < 0){
      value *= -1;
    }
    _sisi = value;
  }

  double get sisi{
    return _sisi;
  }

  double get luas => _sisi * _sisi;
  double get keliling => 4 * _sisi;
}