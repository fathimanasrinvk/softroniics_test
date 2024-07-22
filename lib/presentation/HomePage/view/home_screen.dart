import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors.dart';
import '../controller/homescreencontroller.dart';
import '../../../widget/plant_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PlantController plantController = Get.find();

    return Scaffold(
      backgroundColor: ColorTheme.secondarycolor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset("assets/images/icon_img.png", height: 120),
            ),
            Obx(() {
              if (plantController.plants.isEmpty) {
                return Center(child: Text('No plants added yet'));
              }

              return PlantGrid(
                plants: plantController.plants.map((plant) => plant.imagePath).toList(),
                plantNames: plantController.plants.map((plant) => plant.name).toList(),
                plantDescriptions: plantController.plants.map((plant) => plant.description).toList(),
                plantController: plantController, // Pass the controller here
              );
            }),
          ],
        ),
      ),
    );
  }
}
