import 'package:coach_gym_app/domain/models/model.dart';
import 'package:coach_gym_app/presentation/onboarding/view_model/onboarding_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/costants_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/widgets.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

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
    return StreamBuilder(
        stream: _viewModel.outputSliderViewObject,
        builder: (context, snapshot) {
          return _getContentWidget(snapshot.data);
        });
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.boardingColor,
        body: PageView.builder(
            controller: _pageController,
            itemCount: sliderViewObject.numOfSlides,
            onPageChanged: (index) {
              _viewModel.onPageChanged(index);
            },
            itemBuilder: (context, index) {
              return OnBoardingPage(sliderViewObject.sliderObject);
            }),
        bottomSheet: Container(
            height: AppSize.s150.h,
            color: ColorManager.boardingColor,
            width: double.infinity.w,
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < sliderViewObject.numOfSlides; i++)
                      Padding(
                          padding: const EdgeInsets.all(AppPadding.p4),
                          child: _getPorperSlider(
                              i, sliderViewObject.currentIndex))
                  ],
                ),
                sliderViewObject.currentIndex == 0
                    ? SizedBox(
                        height: AppSize.s50.h,
                      )
                    : SizedBox(height: AppSize.s25.h),
                customElevatedButton(
                    backgroundColor: ColorManager.primary,
                    text: AppStrings.next,
                    onPressed: () {
                      sliderViewObject.currentIndex <
                              sliderViewObject.numOfSlides - 1
                          ? _pageController.animateToPage(_viewModel.goNext(),
                              duration: const Duration(
                                  milliseconds:
                                      AppConstants.sliderAnimationTime),
                              curve: Curves.bounceInOut)
                          : Navigator.pushReplacementNamed(
                              context, Routes.loginOrCreateRoute);
                    },
                    textColor: ColorManager.white),
                SizedBox(height: AppSize.s25.h),
                sliderViewObject.currentIndex == 0
                    ? SizedBox(height: AppSize.s0.h)
                    : customElevatedButton(
                        onPressed: () {
                          _pageController.animateToPage(_viewModel.goPrevious(),
                              duration: const Duration(
                                  milliseconds:
                                      AppConstants.sliderAnimationTime),
                              curve: Curves.bounceInOut);
                        },
                        textColor: ColorManager.primary,
                        backgroundColor: ColorManager.boardingColor,
                        text: AppStrings.back),
              ],
            )),
      );
    }
  }

  Widget _getPorperSlider(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.longSlide);
    } else {
      return SvgPicture.asset(ImageAssets.shortSlide);
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;
  const OnBoardingPage(this._sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          //width: double.infinity,
          child: Image(
              image: AssetImage(
                _sliderObject.image,
              ),
              fit: BoxFit.fill,
              width: AppSize.s390.w,
              height: AppSize.s530.h),
        ),
        SizedBox(
          height: AppSize.s30.h,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        )
      ],
    );
  }
}
