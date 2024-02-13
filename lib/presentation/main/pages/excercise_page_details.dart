import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import '../dummy_data.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExcercisePageDetails extends StatefulWidget {
  const ExcercisePageDetails({super.key});

  @override
  State<ExcercisePageDetails> createState() => _ExcercisePageDetailsState();
}

class _ExcercisePageDetailsState extends State<ExcercisePageDetails> {
  late YoutubePlayerController _controller;

  @override
  Widget build(BuildContext context) {
    final excerciseMuscle =
        ModalRoute.of(context)!.settings.arguments as String;
    final selectedMuscle = DUMMY_EXCERCISES.firstWhere(
        (excerciseDetail) => excerciseDetail.muscle == excerciseMuscle);
    final videoUrl = selectedMuscle.videoUrl;
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(autoPlay: false));
    return Scaffold(
        appBar: AppBar(
            title: Text(
              selectedMuscle.name,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            centerTitle: true,
            backgroundColor: ColorManager.white,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: ColorManager.white,
                statusBarBrightness: Brightness.dark),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
              color: ColorManager.black,
            )),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: AppSize.s360.w,
                height: AppSize.s215.h,
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  onReady: () => debugPrint('Ready'),
                ),
              ),
              SizedBox(
                height: AppSize.s20.h,
              ),
              Text(AppStrings.directions,
                  style: getMediumStyle(
                      fontSize: FontSize.s20.sp,
                      color: ColorManager.black,
                      fontFamily: FontFamilies.fontFamilyRubik)),
              SizedBox(height: AppSize.s30.h),
              Text(selectedMuscle.instructions,
                  style: getLightStyle(
                      fontSize: FontSize.s20.sp,
                      color: ColorManager.muscleDesc,
                      fontFamily: FontFamilies.fontFamilyRubik),
                  softWrap: true)
            ],
          ),
        ));
  }
}
