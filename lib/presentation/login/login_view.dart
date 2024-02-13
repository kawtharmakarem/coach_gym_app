import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';
import '../widgets/widgets.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
              SizedBox(height: AppSize.s158.h),
              Center(
                child: customTitleText(
                    fontSize: FontSize.s30.sp, text: AppStrings.login),
              ),
              SizedBox(height: AppSize.s50.h),
              customText(fontSize: FontSize.s20.sp, text: AppStrings.username),
              SizedBox(height: AppSize.s20.h),
              customTextFormField(hintText: AppStrings.interUsename),
              SizedBox(height: AppSize.s25.h),
              customText(
                  fontSize: FontSize.s20.sp, text: AppStrings.passwordLabel),
              SizedBox(
                height: AppSize.s20.h,
              ),
              customTextFormField(hintText: AppStrings.password),
              SizedBox(
                height: AppSize.s5.h,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: customTextButton(
                    onPressed: () {
                      //goto forgot password
                    },
                    text: AppStrings.forgotPassword,
                    color: ColorManager.forgotClr),
              ),
              SizedBox(
                height: AppSize.s55.h,
              ),
              Center(
                child: customElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, Routes.onBoardingInfoRoute);
                    },
                    textColor: ColorManager.white,
                    backgroundColor: ColorManager.primary,
                    text: AppStrings.login),
              )
            ],
          ),
        ));
  }
}
