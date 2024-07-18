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
    return Scaffold(
      backgroundColor: ColorTheme.secondarycolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              plantImage,
              height: 350,
            ),
            SizedBox(height: 3),
            Text(
              plantName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                plantDescription,
                style: TextStyle(
                  fontSize: 22,
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
                    onPressed: () {},
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
                    child: Text("             Buy             "),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      cartController.addToCart(plantName, plantImage);
                      Get.snackbar(
                        'Added to Cart',
                        '$plantName added to your cart',
                        colorText: ColorTheme.green,
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
                    child: Text("             Cart             "),
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
