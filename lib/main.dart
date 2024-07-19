import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softroniics_test/presentation/HomePage/controller/homescreencontroller.dart';
import 'package:softroniics_test/presentation/HomePage/view/home_screen.dart';
import 'package:softroniics_test/presentation/bottom_navigation/controller/bottomnav_controller.dart';
import 'package:softroniics_test/presentation/bottom_navigation/view/bottomnav_screen.dart';
import 'package:softroniics_test/presentation/login_page/view/login_page.dart';
import 'presentation/cart_page/controller/cart_controller.dart';
import 'presentation/registration_page/view/registration_screen.dart';

void main() {
  Get.put(CartController());
  Get.put(NavigationController());
  Get.put(PlantController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/registration', page: () => RegistrationScreen()),
        GetPage(name: '/bottom-nav', page: () => BottomNavPage()),
        GetPage(name: '/home', page: () => HomeScreen())
      ],
    );
  }
}
