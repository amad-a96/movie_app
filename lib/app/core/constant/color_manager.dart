// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

class ColorManager {
  // static Color primary = HexColor.fromHex('#7747FD');
//   static Color primary = HexColor.fromHex('#7733E9');
//  static Color primary = HexColor.fromHex('#663399');
//   static Color primary = HexColor.fromHex('#5a228b');
//    static Color primary = HexColor.fromHex('#6638A5');
//     static Color primary = HexColor.fromHex('#6E40AF');

  // static Color primary = HexColor.fromHex('#320A5C');
  // static Color primary = HexColor.fromHex('#28104E');


  // static Color primary = HexColor.fromHex('#3c006c');
  static Color primary = HexColor.fromHex('#4f006c');
  // static Color primary = HexColor.fromHex('#36174D');

  static Color black = HexColor.fromHex("#222222");
  static Color primaryBlack = HexColor.fromHex("#0f0c29");
  // static Color gray = HexColor.fromHex("#9B9B9B");
  static Color inputColor = HexColor.fromHex('F9F9F9');
  static Color background = 
  HexColor.fromHex('F6F7F9');
  //  Color.fromARGB(255, 252, 252, 252);
  //  Color.fromARGB(255, 251, 249, 255);

  //  HexColor.fromHex("#FBFBFB");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = Color.fromARGB(255, 186, 20, 5);

  static Color errorTwo = HexColor.fromHex("#F01F0E");
  static Color success = HexColor.fromHex("#40B38F");
  //#40B38F
  static Color saleHot = HexColor.fromHex("#DB3022"); //darker red
  static Color yellow = HexColor.fromHex("#FFBA49");
  static Color orange = HexColor.fromHex("#ED6C00");
  static Color blue = HexColor.fromHex("#2e86de");
  static Color darkBlue = HexColor.fromHex("#341f97");
  static Color pink = HexColor.fromHex("#f368e0");
  static Color orange2 = HexColor.fromHex("#ff9f43");
  static Color red2 = HexColor.fromHex("#ee5253");
  static Color cyan = HexColor.fromHex("#0abde3");
  static Color darkGreen = HexColor.fromHex("#10ac84");
  static Color green = HexColor.fromHex("#01a3a4");
  static Color grey = HexColor.fromHex("#8395a7");
  static Color lightGrey = HexColor.fromHex("#c8d6e5");
  static Color darkGrey = HexColor.fromHex("#576574");
  static Color darkerGrey = HexColor.fromHex("#222f3e");

  // static Color blue = Color.fromARGB(255, 64, 112, 179);
  static Color red = Color.fromARGB(255, 179, 64, 64);

  ///
  static Color red3 = HexColor.fromHex("#EB3B5A");
  static Color orange3 = HexColor.fromHex("#FA8231");
  static Color yellow3 = HexColor.fromHex("#F7B731");
  static Color green3 = HexColor.fromHex("#20BF6B");
  static Color cyan3 = HexColor.fromHex("#10B9B1");
  static Color blue3 = HexColor.fromHex("#2D98DA");
  static Color darkblue3 = HexColor.fromHex("#3867D6");
  static Color purple3 = HexColor.fromHex("#8854D0");
  static Color grey3 = HexColor.fromHex("#A5B1C2");
  static Color lightGrey3 = HexColor.fromHex("#D1D8E0");
  static Color darkGrey3 = HexColor.fromHex("#778CA3");
  static Color darkerGrey3 = HexColor.fromHex("#4B6584");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
