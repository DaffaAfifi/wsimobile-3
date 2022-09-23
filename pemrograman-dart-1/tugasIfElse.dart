import 'dart:io';

void main(List<String> args) {
  print("Username :");
  var nama = stdin.readLineSync()!;
  print("Pilih peranmu!(penyihir/guard/werewolf)");
  var peran = stdin.readLineSync()!;

  print("\n");

  if(nama.isEmpty && peran.isEmpty){
    print("Nama dan peran harus diisi!");
  }else if(nama.isEmpty){
    print("Nama harus diisi!");
  }else if(nama.isNotEmpty && peran.isEmpty){
    print("Halo $nama, Pilih peranmu untuk memulai game!");
  }else if(nama.isNotEmpty && peran == "penyihir"){
    print("Halo penyihir $nama, kamu dapat melihat siapa yang menjadi werewolf.");
  }else if(nama.isNotEmpty && peran == "guard"){
    print("Halo guard $nama, kamu akan membantu melindungi temanmu dari serangan werewolf.");
  }else if(nama.isNotEmpty && peran == "werewolf"){
    print("Halo werewolf $nama, kamu akan memakan mangsa setiap malam!");
  }
}