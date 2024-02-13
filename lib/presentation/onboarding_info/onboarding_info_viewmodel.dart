import 'dart:async';
import "package:flutter/material.dart";
import '../../domain/models/model.dart';
import '../base/base_viewmodel.dart';
import '../resources/strings_manager.dart';
import '../widgets/widgets.dart';

class OnBoardingInfoViewModel extends BaseViewModel
    with OnBoardingInfoViewModelInputs, OnBoardingInfoViewModelOutputs {
  final StreamController _streamController =
      StreamController<SliderInfoViewObject>();
  late final List<SliderInfoObject> _list;
  int _currentIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderInfoData();
    _postDataToView(); //send data to view
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView(); //send new data to view model
  }

  @override
  Sink get inputSliderInfoViewObject => _streamController.sink;

  @override
  Stream<SliderInfoViewObject> get outputSliderInfoViewObject =>
      _streamController.stream
          .map((sliderInfoViewObject) => sliderInfoViewObject);

//private functions for onboardingInfo
  void _postDataToView() {
    inputSliderInfoViewObject.add(SliderInfoViewObject(
        _list[_currentIndex], _list.length, _currentIndex));
  }

  List<SliderInfoObject> _getSliderInfoData() => [
        SliderInfoObject(
            AppStrings.onBoardingInfoTitle1,
            AppStrings.onBoardingInfoSubTitle1,
            AppStrings.onBoardingInfoQuiz1,
            buildGenderQues()),
        SliderInfoObject(
            AppStrings.onBoardingInfoTitle2,
            AppStrings.onBoardingInfoSubTitle2,
            AppStrings.onBoardingInfoQuiz2,
            buildHeightQues()),
        SliderInfoObject(
            AppStrings.onBoardingInfoTitle3,
            AppStrings.onBoardingInfoSubTitle3,
            AppStrings.onBoardingInfoQuiz3,
            buildWeightQues()),
        SliderInfoObject(
            AppStrings.onBoardingInfoTitle4,
            AppStrings.onBoardingInfoSubTitle4,
            AppStrings.onBoardingInfoQuiz4,
            BuildAgeQues()),
        SliderInfoObject(
            AppStrings.onBoardingInfoTitle5,
            AppStrings.onBoardingInfoSubTitle5,
            AppStrings.onBoardingInfoQuiz5,
            buildFitnessQues()),
      ];
}

abstract class OnBoardingInfoViewModelInputs {
  int goNext(); //when user click next or swip
  int goPrevious(); //when user click back or swip
  void onPageChanged(int index);
  Sink get inputSliderInfoViewObject;
}

abstract class OnBoardingInfoViewModelOutputs {
  Stream<SliderInfoViewObject> get outputSliderInfoViewObject;
}
