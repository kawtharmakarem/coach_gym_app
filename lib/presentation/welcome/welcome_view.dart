import 'dart:async';

import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';
import '../resources/costants_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.delay), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const SizedBox(
          width: double.infinity,
          child: Image(
            image: AssetImage(ImageAssets.welcome),
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: AppSize.s77.h,
          left: AppSize.s16.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.welcomeTo,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: AppSize.s45.h,
              ),
              Text(AppStrings.coachGym,
                  style: Theme.of(context).textTheme.displayLarge),
              SizedBox(
                height: AppSize.s30.h,
              ),
              Text(AppStrings.ourGym,
                  style: Theme.of(context).textTheme.displaySmall)
            ],
          ),
        )
      ],
    ));
  }
}
