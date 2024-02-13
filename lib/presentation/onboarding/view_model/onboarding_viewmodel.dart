import 'dart:async';

import 'package:coach_gym_app/presentation/base/base_viewmodel.dart';

import '../../../domain/models/model.dart';
import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  //onBoardingViewModelInputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;

    return nextIndex;
  }

  @override
  int goPrevious() {
    int prevIndex = --_currentIndex;
    return prevIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

//functions
  List<SliderObject> _getSliderData() => [
        SliderObject(ImageAssets.onBoardingImage1, AppStrings.onBoardingTitle1),
        SliderObject(ImageAssets.onBoardingImage2, AppStrings.onBoardingTitle2),
        SliderObject(ImageAssets.onBoardingImage3, AppStrings.onBoardingTitle3),
      ];

  void _postDataToView() {
    inputSliderViewObject.add(
        SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }
}

abstract class OnBoardingViewModelInputs {
  int goNext();
  int goPrevious();
  void onPageChanged(int index);
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}
