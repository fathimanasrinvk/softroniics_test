import 'package:flutter/material.dart';
import 'package:softroniics_test/core/constants/colors.dart';
import 'package:softroniics_test/core/constants/text_style.dart';
import 'package:softroniics_test/presentation/cart_page/view/cart_screen.dart';
import '../../../widget/plant_widget.dart';
import '../../plant_details_page/plant_details_screen.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var plants = [
    "assets/images/plant1.png",
    "assets/images/plant2.png",
    "assets/images/plant3.png",
    "assets/images/plant4.png",
  ];

  var plantNames = [
    "Pothos",
    "Monstera",
    "Parlor palm",
    "Aloe"
  ];

  var plantDescriptions = [
    "Pothos is known for its air-purifying properties and easy maintenance.",
    "Monstera is famous for its unique leaf patterns and tropical vibe.",
    "Parlor palm is a popular indoor plant that adds a touch of greenery.",
    "Aloe is known for its medicinal properties and low water requirements."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.secondarycolor,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset("assets/images/icon_img.png", height: 120),
          ),
          PlantGrid(
            plants: plants,
            plantNames: plantNames,
            plantDescriptions: plantDescriptions,
          ),
        ],
      ),
    );
  }
}