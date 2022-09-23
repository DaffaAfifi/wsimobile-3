void main(List<String> args) {
  int i;
  int a = 3;
  for(i = 1; i<= 20; i++){
    if(i % a == 0 && i % 2 != 0){
      print("$i - I Love Coding");
    }else if(i % a != 0 && i % 2 != 0){
      print("$i - Santai");
    }else if(i % 2 == 0){
      print("$i - Berkualitas");
    }
  }
}