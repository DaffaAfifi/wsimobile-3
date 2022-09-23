void main(List<String> args) {
  var flag = 1;
  var deret = 5;
  var jumlah = 0;

  print("=========While==========");

  while(flag < 5){
    print("iterasi ke-"+ flag.toString());
    flag++;
  }

  print("=======================");

  while(deret > 0){
    jumlah += deret;
    deret--;
    print("Jumlah saat ini: " + jumlah.toString());
  }
  print(jumlah);

  print("=========For===========");

  for(var i = 1; i < 5; i++){
    print("iterasi ke-" +i.toString());
  }

  for(var deret = 5; deret > 0; deret--){
    jumlah += deret;
    print("Jumlah saat ini: " + jumlah.toString());
  }
  print("Jumlah terakhir: " + jumlah.toString());
}