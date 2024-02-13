import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'package:flutter/services.dart';

import '../widgets/widgets.dart';

class SignUpNameView extends StatelessWidget {
  const SignUpNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.boardingColor,
      // appBar: AppBar(
      //   backgroundColor: ColorManager.boardingColor,
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //       statusBarColor: ColorManager.boardingColor,
      //       statusBarBrightness: Brightness.dark),
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSize.s130.h,
            ),
            Center(
                child: customText(
                    fontSize: FontSize.s24.sp, text: AppStrings.signUp)),
            SizedBox(height: AppSize.s55.h),
            customText(fontSize: FontSize.s20.sp, text: AppStrings.name),
            SizedBox(
              height: AppSize.s20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: customTextFormField(hintText: AppStrings.fristName)),
                SizedBox(width: AppSize.s35.w),
                Expanded(
                    child: customTextFormField(hintText: AppStrings.lastName)),
              ],
            ),
            SizedBox(height: AppSize.s25.h),
            customText(fontSize: FontSize.s20.sp, text: AppStrings.email),
            SizedBox(
              height: AppSize.s29.h,
            ),
            customTextFormField(hintText: AppStrings.interEmail),
            SizedBox(height: AppSize.s25.h),
            customText(fontSize: FontSize.s20.sp, text: AppStrings.password),
            SizedBox(height: AppSize.s29.h),
            customTextFormField(hintText: AppStrings.interPassword),
            SizedBox(
              height: AppSize.s25.h,
            ),
            customText(
                fontSize: FontSize.s20.sp, text: AppStrings.confrimPassword),
            SizedBox(height: AppSize.s29.h),
            customTextFormField(hintText: AppStrings.interPassword),
            SizedBox(height: AppSize.s55.h),
            Center(
              child: customElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.codeRoute);
                  },
                  textColor: ColorManager.white,
                  backgroundColor: ColorManager.primary,
                  text: AppStrings.next),
            )
          ],
        ),
      ),
    );
  }
}
