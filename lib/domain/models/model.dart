import 'package:flutter/material.dart';

//onboarding models
class SliderObject {
  String image;
  String title;
  SliderObject(this.image, this.title);
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;
  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}

//onboardingInfo view model object
class SliderInfoObject {
  String title;
  String subTitle;
  String infoTitle;
  Widget child;
  SliderInfoObject(this.title, this.subTitle, this.infoTitle, this.child);
}

class SliderInfoViewObject {
  SliderInfoObject sliderInfoObject;
  int numOfSlides;
  int currentIndex;
  SliderInfoViewObject(
      this.sliderInfoObject, this.numOfSlides, this.currentIndex);
}

