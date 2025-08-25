import 'package:flutter/material.dart';
import 'package:istanbulguidetwo/core/config/theme/app_colors.dart';
import 'package:istanbulguidetwo/core/config/utils/size_config.dart';

class AppTheme {
  static final appTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    brightness: Brightness.light,
    fontFamily: 'Macondo',
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.secondBackGround,
      contentTextStyle: TextStyle(color: AppColors.snackBarTextColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.textFieldBackGroundColor,
      hintStyle: TextStyle(
        color: Color(0xff6C6B6B),
        fontWeight: FontWeight.w400,
        fontSize: SizeConfig.textMultiplier(3.7),
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: SizeConfig.heightMultiplier(1),
        horizontal: SizeConfig.widthMultiplier(5),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: BorderSide(color: AppColors.buttonBorder, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: BorderSide(color: AppColors.buttonBorder, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: BorderSide(color: AppColors.buttonBorder, width: 2.3),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonBackGroundColor,
        elevation: 0,
        foregroundColor: AppColors.buttonTextColor,
        textStyle: TextStyle(
          fontSize: SizeConfig.textMultiplier(5),
          fontWeight: FontWeight.w400,
          fontFamily: 'Macondo',
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        side: BorderSide(color: AppColors.buttonBorder, width: 1),
      ),
    ),
  );
}
