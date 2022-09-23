class lingkaran{
  double _phi = 3.14;
  late double _r;

  void set r(double value){
    if(value < 0){
      value *= -1;
    }
    _r = value;
  }

  double get r{
    return _r;
  }

  double get luas => _phi * _r * _r;
}