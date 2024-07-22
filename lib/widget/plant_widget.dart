import 'dart:io';
import 'package:flutter/material.dart';
import 'package:softroniics_test/core/constants/colors.dart';
import 'package:softroniics_test/core/constants/text_style.dart';
import '../presentation/HomePage/controller/homescreencontroller.dart';
import '../presentation/plant_details_page/plant_details_screen.dart';

class PlantGrid extends StatelessWidget {
  final List<String> plants; // This should contain image paths (both asset and file)
  final List<String> plantNames;
  final List<String> plantDescriptions;
  final PlantController plantController; // Add this line to receive PlantController

  PlantGrid({
    required this.plants,
    required this.plantNames,
    required this.plantDescriptions,
    required this.plantController, // Add this line to receive PlantController
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
      child: SingleChildScrollView(
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1 / 1.6,
          ),
          itemCount: plants.length,
          itemBuilder: (context, index) {
            final imagePath = plants[index];
            final isAsset = !imagePath.startsWith('/');
            ImageProvider imageProvider;
            if (isAsset) {
              imageProvider = AssetImage(imagePath);
            } else {
              imageProvider = FileImage(File(imagePath));
            }

            return Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlantDetailPage(
                          plantName: plantNames[index],
                          plantImage: imagePath,
                          plantDescription: plantDescriptions[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fitWidth,
                      ),
                      color: ColorTheme.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 210),
                      child: Center(
                        child: Text(
                          plantNames[index],
                          style: TextStyle(
                            color: ColorTheme.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //   top: 10,
                //   right: 10,
                //   child: IconButton(
                //     icon: Icon(Icons.delete, color: Colors.grey),
                //     onPressed: () {
                //       plantController.removePlant(index);
                //     },
                //   ),
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}
