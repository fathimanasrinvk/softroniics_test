import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softroniics_test/core/constants/colors.dart';
import '../cart_page/controller/cart_controller.dart';

class PlantDetailPage extends StatelessWidget {
  final String plantName;
  final String plantImage;
  final String plantDescription;
  final CartController cartController = Get.find();

  PlantDetailPage({
    required this.plantName,
    required this.plantImage,
    required this.plantDescription,
  });

  @override
  Widget build(BuildContext context) {
    final bool isAsset = !plantImage.startsWith('/'); // Check if image path is asset or file

    return Scaffold(
      backgroundColor: ColorTheme.secondarycolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isAsset
                ? Image.asset(
              plantImage,
              height: 350,
              fit: BoxFit.cover,
            )
                : Image.file(
              File(plantImage),
              height: 350,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              plantName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ColorTheme.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                plantDescription,
                style: TextStyle(
                  fontSize: 18,
                  color: ColorTheme.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: ColorTheme.white,
                      backgroundColor: ColorTheme.maincolor,
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      textStyle: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    child: Text("            Buy            "),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      cartController.addToCart(plantName, plantImage);
                      Get.snackbar(
                        'Added to Cart',
                        '$plantName added to your cart',
                        colorText: ColorTheme.white,
                        backgroundColor: ColorTheme.green,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: ColorTheme.white,
                      backgroundColor: ColorTheme.maincolor,
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      textStyle: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    child: Text("            Cart            "),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
