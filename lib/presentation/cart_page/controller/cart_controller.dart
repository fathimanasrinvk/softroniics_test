import 'package:get/get.dart';

class CartController extends GetxController {
  final cartItems = [].obs;

  void addToCart(String plantName, String plantImage) {
    cartItems.add({'name': plantName, 'image': plantImage});
  }
}
