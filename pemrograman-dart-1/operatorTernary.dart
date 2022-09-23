void main(List<String> args) {
  var iniDaffa = true;
  var barberStatus = "Close";
  var minuteRemainingToOpen = 30;
  var minimarketStatus = "Open";
  var Telur = "Soldout";
  var Buah = "Soldout";

  print("==========IF=========");

  if(iniDaffa){
    print("Benar ini Daffa");
  }else{
    print("Ini bukan Daffa");
  }

  print("========ELSE IF=========");

  if (barberStatus == "Open"){
    print("Saya akan memotong rambut");
  }else if(minuteRemainingToOpen <= 10){
    print("Barbershop buka sebentar lagi, saya akan menunggu");
  }else{
    print("Barbershop tutup, saya akan kembali besok");
  }

  print("========IF NESTED=========");

  if (minimarketStatus == "Open"){
    print("Saya akan membeli telur dan buah");
    if (Telur == "Soldout" || Buah == "Soldout"){
      print("Belanjaan saya tidak lengkap");
    }else if(Telur == "Soldout"){
      print("Telur Habis");
    }else if(Buah == "Soldout"){
      print("Buah habis");
    }
  } else {
    print("Minimarket tutup, saya pulang lagi");
  }

  print("========SWITCH CASE========");

  var trafficLightsStatus = "Yellow";
  switch(trafficLightsStatus){
    case "Red": {print("Vehicle stop"); break;}
    case "Yellow": {print("Vehicle getting ready to go"); break;}
    case "Green": {print("Vehicle go"); break;}
    default: {print("Nothing happen");}
  }
}
