import 'package:get/get.dart';
import '/model/product.dart';

class Purchase extends GetxController {
  var products = <Product>[].obs;
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    // ignore: prefer_const_constructors
    await Future.delayed(Duration(seconds: 1));
    var serverResponse = [
      Product(
          1,
          "Demo Product 1",
          "https://upload.wikimedia.org/wikipedia/commons/9/94/Kerupuk_kulit.JPG",
          "This is that we are going to show by getX",
          100.0),
      Product(
          1,
          "Demo Product 2",
          "https://lzd-img-global.slatic.net/g/p/695950071edf965f2234a5cbb1adf03e.jpg_720x720q80.jpg_.webp",
          "This is that we are going to show by getX",
          100.0),
    ];
    products.value = serverResponse;
  }
}
