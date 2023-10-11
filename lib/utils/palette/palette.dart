import 'package:flutter/material.dart';

class Palette {
  static const primaryColor = Color(0xff3eb489);
  static const secondaryColor = Color(0xffefefef);
  static const darkColor = Color(0xff232323);
  static const lightColor = Colors.white;
  static const category1 = Color(0xff8a6ae3);
  static const category2 = Color(0xff29a0a6);
  static const category3 = Color(0xff3691e8);
  static const category4 = Color(0xffff9701);
  static const category5 = Color(0xfff77692);

  static const MaterialColor primaryToDark = MaterialColor(
    0xff3eb489,
    <int, Color>{
      50: Color(0xff38a27b),
      100: Color(0xff32906e),
      200: Color(0xff2b7e60),
      300: Color(0xff256c52),
      400: Color(0xff1f5a45),
      500: Color(0xff194837),
      600: Color(0xff133629),
      700: Color(0xff06120e),
      800: Color(0xff06120e),
    },
  );

  static const MaterialColor secondaryToDark =
      MaterialColor(0xffefefef, <int, Color>{
    50: Color(0xff5f5f5f),
    100: Color(0xff545454),
    200: Color(0xff4a4a4a),
    300: Color(0xff3f3f3f),
    400: Color(0xff353535),
    500: Color(0xff2a2a2a),
    600: Color(0xff1f1f1f),
    700: Color(0xff151515),
    800: Color(0xff0a0a0a),
  });
}
