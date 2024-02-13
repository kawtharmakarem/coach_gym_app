import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/costants_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({super.key});

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.delay), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.welcomeRoute);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: AppSize.s288.h),
          Text(
            AppStrings.coachGym,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: AppSize.s42),
          SvgPicture.asset(
            ImageAssets.gymLogo,
            width: AppSize.s150.w,
            height: AppSize.s150.h,
          ),
          SizedBox(height: AppSize.s158.h),
          SpinKitCircle(
            color: ColorManager.spinkColor,
            size: AppSize.s100.r,
            duration: const Duration(seconds: AppConstants.delay),
          )
        ],
      ),
    );
  }
}
