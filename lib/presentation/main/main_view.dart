import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';
import 'dummy_data.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late final List<MuscleObject> _list = DUMMY_MUSCLES;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.boardingColor,
      body: SafeArea(
          child: GridView(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.s16.w, vertical: AppSize.s40.h),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: AppSize.s200.w,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: AppSize.s18.w,
                mainAxisSpacing: AppSize.s26.h,
              ),
              children: _list.map((muscleObject) {
                return MuscleItem(
                    id: muscleObject.id,
                    title: muscleObject.title,
                    image: muscleObject.image,
                    color: muscleObject.color);
              }).toList())),
    );
  }
}
