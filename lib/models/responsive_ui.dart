import 'package:flutter/material.dart';

class ResponsiveUi {
  static double deviceHeight = 0.0;
  static double deviceWidth = 0.0;

  static double getWidth(BuildContext context, double padding) {
    return MediaQuery.of(context).size.width - padding;
  }
}
