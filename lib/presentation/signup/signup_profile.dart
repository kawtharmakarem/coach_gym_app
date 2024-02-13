import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import '../widgets/widgets.dart';
import '../resources/font_manager.dart';
import '../resources/routes_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';

class SignUpProfileView extends StatefulWidget {
  const SignUpProfileView({super.key});

  @override
  State<SignUpProfileView> createState() => _SignUpProfileViewState();
}

class _SignUpProfileViewState extends State<SignUpProfileView> {
  File? image;

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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: AppSize.s63.h),
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSize.s20.h),
                  child: customTextButton(
                      onPressed: () {
                        //todo
                      },
                      text: AppStrings.doYouHaveAccount,
                      color: ColorManager.txtbuttonClr),
                )),
            SizedBox(height: AppSize.s78.h),
            Center(
              child: ProfileImage(
                  image: File(ImageAssets.cameraFullpath),
                  onClicked: (ImageSource imageSource) async {
                    return pickImage(imageSource);
                  }),
            ),
            SizedBox(
              height: AppSize.s30.h,
            ),
            Center(
              child: Text(
                AppStrings.addProfile,
                style: TextStyle(
                    fontSize: FontSize.s24.sp,
                    color: ColorManager.black,
                    fontWeight: FontWeightManager.regular,
                    decoration: TextDecoration.underline,
                    fontFamily: FontFamilies.fontFamilyRubik),
              ),
            ),
            SizedBox(height: AppSize.s60.h),
            customText(fontSize: FontSize.s20.sp, text: AppStrings.phoneNumber),
            SizedBox(
              height: AppSize.s20.h,
            ),
            customTextFormField(hintText: AppStrings.phoneHint),
            SizedBox(height: AppSize.s40.h),
            customTextFormField(hintText: AppStrings.location),
            SizedBox(height: AppSize.s20.h),

            // CustomDropdownButton(
            //     hintText: AppStrings.enterLocation,
            //     items: [])
            //needs mending
            SizedBox(height: AppSize.s55.h),
            Center(
              child: customElevatedButton(
                  onPressed: () {
                    //go to loginPage
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  textColor: ColorManager.white,
                  backgroundColor: ColorManager.primary,
                  text: AppStrings.create),
            )
          ]),
        ));
  }

  Future pickImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image :$e');
    }
  }
}
