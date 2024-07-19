import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softroniics_test/core/constants/colors.dart';
import 'package:softroniics_test/presentation/HomePage/view/home_screen.dart';
import 'package:softroniics_test/presentation/cart_page/view/cart_screen.dart';
import '../../addplantpage/addplantscreen.dart';
import '../controller/bottomnav_controller.dart';

class BottomNavPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationController = Get.put(NavigationController());

    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: navigationController.selectedIndex.value,
          children: [
            HomeScreen(),
            AddPlantScreen(),
            CartPage(),
          ],
        );
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: ColorTheme.green,
          unselectedItemColor: ColorTheme.white,
          elevation: 0,
          backgroundColor: ColorTheme.secondarycolor,
          currentIndex: navigationController.selectedIndex.value,
          onTap: navigationController.onItemTapped,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Color(0xffE7F9DA),
              icon: Icon(Icons.home, ),
              label: '',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xffE7F9DA),
              icon: Icon(Icons.add_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xffE7F9DA),
              icon: Icon(Icons.shopping_cart),
              label: '',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xffE7F9DA),
              icon: Icon(Icons.person_2_outlined),
              label: '',
            ),
          ],
        );
      }),
    );
  }
}
