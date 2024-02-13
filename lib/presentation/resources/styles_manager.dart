import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, Color color, String fontFamily) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );
}

TextStyle getRegularStyle(
    {double fontSize = FontSize.s14,
    required Color color,
    required String fontFamily}) {
  return _getTextStyle(
      fontSize.sp, FontWeightManager.regular, color, fontFamily);
}

TextStyle getMediumStyle(
    {double fontSize = FontSize.s16,
    required Color color,
    required String fontFamily}) {
  return _getTextStyle(
      fontSize.sp, FontWeightManager.medium, color, fontFamily);
}

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s14,
    required Color color,
    required String fontFamily}) {
  return _getTextStyle(
      fontSize.sp, FontWeightManager.semiBold, color, fontFamily);
}

TextStyle getLightStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    required String fontFamily}) {
  return _getTextStyle(fontSize.sp, FontWeightManager.light, color, fontFamily);
}

TextStyle getBoldStyle(
    {double fontSize = FontSize.s16,
    required Color color,
    required String fontFamily}) {
  return _getTextStyle(fontSize.sp, FontWeightManager.bold, color, fontFamily);
}
