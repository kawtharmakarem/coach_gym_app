import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../domain/models/model.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/costants_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';
import '../widgets/widgets.dart';
import '../resources/font_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'onboarding_info_viewmodel.dart';

class OnBoardingInfo extends StatefulWidget {
  const OnBoardingInfo({super.key});

  @override
  State<OnBoardingInfo> createState() => _OnBoardingInfoState();
}

class _OnBoardingInfoState extends State<OnBoardingInfo> {
  final PageController _pageController = PageController();
  final OnBoardingInfoViewModel _viewModel = OnBoardingInfoViewModel();
  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderInfoViewObject>(
        stream: _viewModel.outputSliderInfoViewObject,
        builder: (context, snapshot) {
          return _getContentWidget(snapshot.data);
        });
  }

  Widget _getContentWidget(SliderInfoViewObject? sliderInfoViewObject) {
    if (sliderInfoViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.boardingColor,
        // appBar: AppBar(
        //   backgroundColor: ColorManager.white,
        //   systemOverlayStyle: SystemUiOverlayStyle(
        //       statusBarColor: ColorManager.white,
        //       statusBarBrightness: Brightness.dark),
        // ),
        body: PageView.builder(
            controller: _pageController,
            itemCount: sliderInfoViewObject.numOfSlides,
            onPageChanged: (index) {
              _viewModel.onPageChanged(index);
            },
            itemBuilder: (context, index) {
              return OnBoardingInfoPage(sliderInfoViewObject.sliderInfoObject);
            }),
        bottomSheet: bottomSheetWidget(sliderInfoViewObject),
      );
    }
  }

  Widget bottomSheetWidget(SliderInfoViewObject sliderInfoViewObject) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
      color: ColorManager.boardingColor,
      height: AppSize.s90.h,
      width: AppSize.s390.w,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < sliderInfoViewObject.numOfSlides; i++)
              Padding(
                  padding: const EdgeInsets.all(AppPadding.p2),
                  child: _getPorperSlider(i, sliderInfoViewObject.currentIndex))
          ],
        ),
        SizedBox(height: AppSize.s20.h),
        sliderInfoViewObject.currentIndex == 0
            ? customElevatedButton(
                onPressed: () {
                  //goto next board from first board
                  _pageController.animateToPage(1,
                      duration: const Duration(
                          milliseconds: AppConstants.sliderAnimationTime),
                      curve: Curves.bounceInOut);
                },
                textColor: ColorManager.white,
                backgroundColor: ColorManager.primary,
                text: AppStrings.continueTo)
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: customElevatedButton(
                        onPressed: () {
                          _pageController.animateToPage(_viewModel.goPrevious(),
                              duration: const Duration(
                                  milliseconds:
                                      AppConstants.sliderAnimationTime),
                              curve: Curves.bounceInOut);
                        },
                        textColor: ColorManager.primary,
                        backgroundColor: ColorManager.white,
                        text: AppStrings.back),
                  ),
                  SizedBox(
                    width: AppSize.s10.w,
                  ),
                  Expanded(
                    child: customElevatedButton(
                        onPressed: () {
                          sliderInfoViewObject.currentIndex ==
                                  sliderInfoViewObject.numOfSlides - 1
                              ? Navigator.pushReplacementNamed(
                                  context, Routes.tabsScreenRoute)
                              : _pageController.animateToPage(
                                  _viewModel.goNext(),
                                  duration: const Duration(
                                      milliseconds:
                                          AppConstants.sliderAnimationTime),
                                  curve: Curves.bounceInOut);
                        },
                        textColor: ColorManager.white,
                        backgroundColor: ColorManager.primary,
                        text: sliderInfoViewObject.currentIndex ==
                                sliderInfoViewObject.numOfSlides - 1
                            ? AppStrings.done
                            : AppStrings.next),
                  )
                ],
              )
      ]),
    );
  }

  Widget _getPorperSlider(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.purpleCircle);
    } else {
      return SvgPicture.asset(ImageAssets.greyCircle);
    }
  }
}

class OnBoardingInfoPage extends StatelessWidget {
  final SliderInfoObject _sliderInfoObject;
  const OnBoardingInfoPage(this._sliderInfoObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
      child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: AppSize.s103.h),
            customTitleText(
                fontSize: FontSize.s24.sp, text: _sliderInfoObject.title),
            SizedBox(
              height: AppSize.s35.h,
            ),
            Text(
              _sliderInfoObject.subTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            SizedBox(height: AppSize.s111.h),
            customText(
                fontSize: FontSize.s25.sp, text: _sliderInfoObject.infoTitle),
            _sliderInfoObject.child
          ]),
    );
  }
}
