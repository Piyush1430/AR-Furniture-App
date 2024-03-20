import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "");
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}

class ColorManager {
  static Color textGrey = HexColor.fromHex("#645F57");
  static Color grey = HexColor.fromHex("#CFC6B7");
  static Color cream = HexColor.fromHex("#CEBB9E");
  static Color darkGrey = HexColor.fromHex("#645F57");
  static Color brown = HexColor.fromHex("#62442B");
  static Color primary = HexColor.fromHex("#FFFFFF");
  static Color moneyColor = const Color.fromARGB(255, 23, 97, 27);
}
