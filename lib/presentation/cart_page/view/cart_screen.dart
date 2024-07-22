import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softroniics_test/core/constants/colors.dart';
import '../controller/cart_controller.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.secondarycolor,
      body: Obx(() => Padding(
        padding: const EdgeInsets.all(40),
        child: ListView.builder(
          itemCount: cartController.cartItems.length,
          itemBuilder: (context, index) {
            var item = cartController.cartItems[index];
            final imagePath = item['image'];
            final isAsset = !imagePath.startsWith('/');

            ImageProvider imageProvider;
            if (isAsset) {
              imageProvider = AssetImage(imagePath);
            } else {
              imageProvider = FileImage(File(imagePath));
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: ColorTheme.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                title: Text(
                  item['name'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Image(
                  image: imageProvider,
                  width: 70,
                  height: 70,
                  fit: BoxFit.fill,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: ColorTheme.black),
                  onPressed: () {
                    cartController.removeFromCart(index);
                  },
                ),
              ),
            );
          },
        ),
      )),
    );
  }
}
