import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';
import '../widgets/widgets.dart';

class LoginOrCreateView extends StatelessWidget {
  const LoginOrCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: AppSize.s44.h,
          backgroundColor: ColorManager.black,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.black,
              statusBarBrightness: Brightness.light),
        ),
        body: SafeArea(
            child: Stack(children: [
          Image(
            width: AppSize.s390.w,
            height: AppSize.s801.h,
            image: const AssetImage(ImageAssets.loginOrCreate),
            fit: BoxFit.fill,
          ),
          Positioned(
            left: AppSize.s20.w,
            bottom: AppSize.s255.h,
            child: Text(
              AppStrings.loginOrCreate,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Positioned(
            left: AppSize.s20.w,
            bottom: AppSize.s50.h,
            child: Column(
              children: [
                rectangleElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, Routes.signUpRoute);
                    },
                    backgroundColor: ColorManager.btnColor1,
                    text: AppStrings.createAccount,
                    textColor: ColorManager.btnTxt1),
                SizedBox(height: AppSize.s25.h),
                rectangleElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, Routes.loginRoute);
                    },
                    backgroundColor: ColorManager.btnColor2,
                    text: AppStrings.haveAccount,
                    textColor: ColorManager.black)
              ],
            ),
          )
        ])));
  }
}
