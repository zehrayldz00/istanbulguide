import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }

  // responsive text simple :
  static double textMultiplier(double value) {
    return blockSizeHorizontal * value;
  }

  // responsive padding/margin
  static double heightMultiplier(double value) {
    return blockSizeVertical * value;
  }

  static double widthMultiplier(double value) {
    return blockSizeHorizontal * value;
  }
}
