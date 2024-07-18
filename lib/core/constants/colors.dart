import 'package:flutter/material.dart';

class ColorTheme {
  static Color maincolor = Color(0xff92D722);
  static Color secondarycolor = Color(0xffE7F9DA);
  static Color white = Color(0xFFffffff);
  static Color black = const Color.fromARGB(255, 0, 0, 0);
  static Color green = const Color(0xFF189649);
}
double constantsize(BuildContext context) {
  return MediaQuery.of(context).size.width * (1 / 411);
}