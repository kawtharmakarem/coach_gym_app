import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';
import '../widgets/widgets.dart';

class CodeView extends StatefulWidget {
  const CodeView({super.key});

  @override
  State<CodeView> createState() => _CodeViewState();
}

class _CodeViewState extends State<CodeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.primary,
        // appBar: AppBar(
        //   backgroundColor: ColorManager.primary,
        //   systemOverlayStyle: SystemUiOverlayStyle(
        //       statusBarColor: ColorManager.primary,
        //       statusBarBrightness: Brightness.light),
        // ),
        body: Column(children: [
          SizedBox(height: AppSize.s288.h),
          Text(AppStrings.sentCode,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium),
          SizedBox(height: AppSize.s10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.sentTo,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                AppStrings.sentToPhone,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          SizedBox(
            height: AppSize.s10.h,
          ),
          SizedBox(
            width: AppSize.s47.w,
            height: AppSize.s25.h,
            child: TextFormField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorManager.codeClr, width: AppSize.s1.w)),
                hintStyle: Theme.of(context).textTheme.headlineSmall,
                hintText: AppStrings.hintCode,
              ),
            ),
          ),
          SizedBox(height: AppSize.s60.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.resend,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                AppStrings.numOFResend,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          SizedBox(height: AppSize.s30.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppSize.s50.w),
            child: customElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, Routes.signupProfileRoute);
                },
                textColor: ColorManager.black,
                backgroundColor: ColorManager.codeClr,
                text: AppStrings.next),
          )
        ]));
  }
}
