import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softroniics_test/presentation/HomePage/view/home_screen.dart';
import 'package:softroniics_test/presentation/cart_page/controller/cart_controller.dart';
import 'package:softroniics_test/presentation/plant_details_page/plant_details_screen.dart';
import 'package:softroniics_test/presentation/registration_page/view/registration_screen.dart';

void main() {
  Get.put(CartController()); // Initialize CartController
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: RegistrationScreen(),
  ));
}
