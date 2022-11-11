import 'package:getx_minggu_9/controller/purchase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/controller/demoController.dart';

class HomePage extends StatelessWidget {
  final Purchase ctrl = Get.put(Purchase());
  DemoController cart = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Getx'),
        actions: [
          IconButton(
            onPressed: () => cart.resetCart(),
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      bottomSheet: SafeArea(
        child: Card(
          elevation: 12.0,
          margin: EdgeInsets.zero,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            height: 65,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Icon(
                        Icons.shopping_cart_rounded,
                        color: Colors.white,
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          height: 14,
                          width: 14,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Center(
                            child: GetX<DemoController>(builder: (controller) {
                              return Text(
                                '${controller.cartCount}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.0),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GetX<DemoController>(builder: (controller) {
                    return Text(
                      'Total Amount - ${controller.totalAmount}',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 16.0),
                    );
                  }),
                  IconButton(
                      onPressed: () => Get.toNamed('/cart',
                          arguments:
                              "Home Page to Demo Page -> Passing arguments"),
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),

      // container
      body: Container(
        child: GetX<Purchase>(builder: (controller) {
          return ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            '${controller.products[index].productImage}',
                            fit: BoxFit.cover,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.products[index].productName,
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0),
                                      ),
                                      Text(
                                          controller.products[index]
                                              .productDescription,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12.0)),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                    onPressed: () => cart
                                        .addToCart(controller.products[index]),
                                    child: Text(
                                      'Shop Now',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12.0),
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ));
        }),
      ),
    );
  }
}
