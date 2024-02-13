import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //basics
    primaryColor: ColorManager.primary,
    splashColor: ColorManager.lightPrimary,

    // appBarTheme: AppBarTheme(
    //     centerTitle: true,
    //     color: ColorManager.primary,
    //     elevation: AppSize.s0.h,
    //     shadowColor: ColorManager.lightPrimary,
    //     titleTextStyle: getRegularStyle(
    //         color: ColorManager.white,
    //         fontFamily: FontFamilies.fontFamilyRubik)),

    //cardViewTheme
    cardTheme: CardTheme(
      color: ColorManager.lightPrimary,
      shadowColor: ColorManager.spinkColor,
    ),

    //textTheme
    textTheme: TextTheme(
      titleLarge: getSemiBoldStyle(
          fontSize: FontSize.s24.sp,
          color: ColorManager.white,
          fontFamily: FontFamilies.fontFamilyInter), //with loading page appname

      displayLarge: getBoldStyle(
          fontSize: FontSize.s40.sp,
          color: ColorManager.welcomeColor,
          fontFamily: FontFamilies.fontFamilyRubik),
      displayMedium: getSemiBoldStyle(
          fontSize: FontSize.s50.sp,
          color: ColorManager.welcomeColor,
          fontFamily: FontFamilies.fontFamilyRubik), //welcome page *welcome to*

      displaySmall: getRegularStyle(
          color: ColorManager.white,
          fontFamily:
              FontFamilies.fontFamilyRubik), //welcome page *description*

      bodyLarge: getMediumStyle(
          fontSize: FontSize.s32.sp,
          color: ColorManager.black,
          fontFamily: FontFamilies.fontFamilyRubik), //onboarding title

      bodyMedium: getSemiBoldStyle(
          fontSize: FontSize.s30.sp,
          color: ColorManager.white,
          fontFamily: FontFamilies.fontFamilyRubik), //loginorcreate

      bodySmall: getLightStyle(
          fontSize: FontSize.s16.sp,
          color: ColorManager.white,
          fontFamily: FontFamilies.fontFamilyRubik), //code *text2*

      headlineMedium: getMediumStyle(
          fontSize: FontSize.s20.sp,
          color: ColorManager.white,
          fontFamily: FontFamilies.fontFamilyRubik), //code mainText

      headlineSmall: getRegularStyle(
          fontSize: FontSize.s20.sp,
          color: ColorManager.codeClr,
          fontFamily: FontFamilies.fontFamilyRubik), //signUp

      labelSmall: getRegularStyle(
          color: ColorManager.black, fontFamily: FontFamilies.fontFamilyRubik),
      titleSmall: getRegularStyle(
          fontSize: FontSize.s24.sp,
          color: ColorManager.boardingColor,
          fontFamily: FontFamilies.fontFamilyRubik), //for hidden Texr

      labelLarge: getBoldStyle(
          fontSize: FontSize.s20.sp,
          color: ColorManager.white,
          fontFamily: FontFamilies.fontFamilyRubik), //for excerciseItem

      labelMedium: getLightStyle(
          fontSize: FontSize.s10.sp,
          color: ColorManager.hintClr,
          fontFamily:
              FontFamilies.fontFamilyRubik), //fitness subtitle *onboarding info

      headlineLarge: getBoldStyle(
          fontSize: FontSize.s25.sp,
          color: ColorManager.black,
          fontFamily: FontFamilies.fontFamilyRubik), //for main view
    ),
  );
}
