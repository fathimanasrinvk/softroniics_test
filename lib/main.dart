import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softroniics_test/presentation/bottom_navigation/controller/bottomnav_controller.dart';
import 'package:softroniics_test/presentation/bottom_navigation/view/bottomnav_screen.dart';
import 'package:provider/provider.dart';
import 'presentation/cart_page/controller/cart_controller.dart';
import 'presentation/registration_page/view/registration_screen.dart';
import 'presentation/cart_page/view/cart_screen.dart';
import 'presentation/plant_details_page/plant_details_screen.dart';

void main() {
  Get.put(CartController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavigationController(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}

