import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softroniics_test/core/constants/colors.dart';
import '../controller/cart_controller.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.find(); // Accessing the cart controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.secondarycolor,
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Obx(() => ListView.builder(
        itemCount: cartController.cartItems.length,
        itemBuilder: (context, index) {
          var item = cartController.cartItems[index];
          return ListTile(
            title: Text(item['name']), // Display plant name
            leading: Image.asset(item['image']), // Display plant image
            // trailing: IconButton(
            //   icon: Icon(Icons.remove_circle),
            //   onPressed: () {
            //     cartController.removeFromCart(index);
            //   },
            // ),
          );
        },
      )),
    );
  }
}
