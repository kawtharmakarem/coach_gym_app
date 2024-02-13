import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/widgets.dart';

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: AppSize.s30.h),
          Center(
            child: Text(
              AppStrings.gymTrainers,
              style: getMediumStyle(
                  fontSize: FontSize.s20.sp,
                  color: ColorManager.primary,
                  fontFamily: FontFamilies.fontFamilyRubik),
            ),
          ),
          CustomToggleSwitch(),
          customCard(image: ImageAssets.mentrImage1)
        ],
      ),
    );
  }
}

Widget customCard({required String image}) {
  return Card(
    child: Stack(
      children: [
        Container(
            width: double.infinity,
            height: AppSize.s166.h,
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(AppSize.s10.r))),
        Positioned(
          bottom: AppSize.s0.h,
          left: AppSize.s0.w,
          child: Container(
            width: AppSize.s360.w,
            height: AppSize.s134.h,
            decoration: BoxDecoration(
              color: ColorManager.primary,
              borderRadius: BorderRadius.circular(AppSize.s10.r),
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text('Trainers names and descriptions'),
              customElevatedButton(
                  onPressed: () {
                    //book a ssesion
                  },
                  textColor: ColorManager.white,
                  backgroundColor: ColorManager.lightBlue,
                  text: 'Book a session')
            ]),
          ),
        ),
        Positioned(
            top: AppSize.s0.h,
            left: AppSize.s0.w,
            child: Image.asset(image,
                height: AppSize.s166.h, width: AppSize.s117.w))
      ],
    ),
  );
}
