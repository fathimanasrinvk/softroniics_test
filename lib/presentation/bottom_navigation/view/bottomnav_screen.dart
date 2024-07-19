import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softroniics_test/core/constants/colors.dart';
import 'package:softroniics_test/presentation/Adminportal/AdminPage.dart';
import 'package:softroniics_test/presentation/HomePage/view/home_screen.dart';
import 'package:softroniics_test/presentation/cart_page/view/cart_screen.dart';

import '../controller/bottomnav_controller.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationController = Provider.of<NavigationController>(context);

    return Scaffold(
      body: IndexedStack(
        index: navigationController.selectedIndex,
        children: [
          HomeScreen(),
          AdminPage(),
          CartPage(),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorTheme.secondarycolor,
        currentIndex: navigationController.selectedIndex,
        onTap: navigationController.onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.green,),
            label: '',
          ),BottomNavigationBarItem(
            icon: Icon(Icons.add_rounded,color: Colors.green,),
            label: '',
          ),BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,color: Colors.green,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined,color: Colors.green,),
            label: '',
          ),
        ],
      ),
    );
  }
}
