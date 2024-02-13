import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/costants_manager.dart';

import '../resources/strings_manager.dart';
import 'pages/excercise_page_details.dart';
import 'pages/excercises.dart';
import '../resources/values_manager.dart';

class MuscleObject {
  final String id;
  final String title;
  final Color color;
  final String image;

  MuscleObject(
      {required this.id,
      required this.title,
      required this.color,
      required this.image});
}

class MuscleItem extends StatelessWidget {
  final String id;
  final String title;
  final String image;
  final Color color;
  const MuscleItem(
      {super.key,
      required this.id,
      required this.title,
      required this.color,
      required this.image});

  void selectMuscle(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ExcercisesPage(),
        settings: RouteSettings(arguments: {'id': id, 'title': title})));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMuscle(context),
      borderRadius: BorderRadius.circular(AppSize.s6.r),
      splashColor: color.withOpacity(AppConstants.splashOpacity7),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppSize.s6.r),
        ),
        child: Stack(children: [
          Positioned(
              top: AppSize.s5.h,
              left: AppSize.s5.w,
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelLarge,
              )),
          Positioned(
            bottom: AppSize.s0.w,
            right: AppSize.s0.h,
            child: Image.asset(image,
                width: AppSize.s100.w,
                fit: BoxFit.fill), //todo width and height for the image
          )
        ]),
      ),
    );
  }
}

class MuscleExcercise {
  String name;
  String type;
  String muscle;
  String equipment;
  String difficulty;
  String videoUrl;
  String instructions;
  MuscleExcercise(
      {required this.name,
      required this.type,
      required this.muscle,
      required this.equipment,
      required this.difficulty,
      required this.videoUrl,
      required this.instructions});
}

List<MuscleObject> DUMMY_MUSCLES = [
  MuscleObject(
      id: AppStrings.one,
      title: AppStrings.chest,
      color: ColorManager.primary,
      image: ImageAssets.chestExcercise),
  MuscleObject(
      id: AppStrings.two,
      title: AppStrings.back,
      color: ColorManager.primary,
      image: ImageAssets.backExcercise),
  MuscleObject(
      id: AppStrings.three,
      title: AppStrings.biceps,
      color: ColorManager.lightBlue,
      image: ImageAssets.bicepsExcercise),
  MuscleObject(
      id: AppStrings.four,
      title: AppStrings.triceps,
      color: ColorManager.lightBlue,
      image: ImageAssets.tricepsExcercise),
  MuscleObject(
      id: AppStrings.five,
      title: AppStrings.shoulders,
      color: ColorManager.primary,
      image: ImageAssets.shouldersExcercise),
  MuscleObject(
      id: AppStrings.six,
      title: AppStrings.legs,
      color: ColorManager.primary,
      image: ImageAssets.legsExcercise),
  MuscleObject(
      id: AppStrings.seven,
      title: AppStrings.customTraining,
      color: ColorManager.lightBlue,
      image: ImageAssets.customTrainingExcercise),
  MuscleObject(
      id: AppStrings.eight,
      title: AppStrings.cardio,
      color: ColorManager.lightBlue,
      image: ImageAssets.cardioExcercise),
];

class MuscleExcerciseItem extends StatelessWidget {
  final String image;
  final String name;
  final String muscle;

  const MuscleExcerciseItem({
    super.key,
    required this.image,
    required this.name,
    required this.muscle,
  });
  void selectMuscleExcercise(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ExcercisePageDetails(),
        settings: RouteSettings(arguments: muscle)));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMuscleExcercise(context),
      borderRadius: BorderRadius.circular(AppSize.s6.r),
      child: Card(
        color: ColorManager.primary.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s6.r),
        ),
        margin: EdgeInsets.symmetric(
            horizontal: AppMargin.m15.w,
            vertical: AppMargin.m45.h), //todo margin vertical
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.asset(
            image, width: AppSize.s72.w,
            height: AppSize.s63.h, //todo height and width to  the image
          ),
          Text(name, style: Theme.of(context).textTheme.labelSmall)
        ]),
      ),
    );
  }
}

//Dummy api

List<MuscleExcercise> DUMMY_EXCERCISES = [
  MuscleExcercise(
      name: "Incline Hammer Curls",
      type: "strength",
      muscle: "biceps",
      equipment: "dumbbell",
      difficulty: "beginner",
      videoUrl: "https://youtu.be/LWdhO_OMrHk",
      instructions:
          "Seat yourself on an incline bench with a dumbbell in each hand. You should pressed firmly against he back with your feet together. Allow the dumbbells to hang straight down at your side, holding them with a neutral grip. This will be your starting position. Initiate the movement by flexing at the elbow, attempting to keep the upper arm stationary. Continue to the top of the movement and pause, then slowly return to the start position."),
  MuscleExcercise(
      name: "Wide-grip barbell curl",
      type: "strength",
      muscle: "biceps",
      equipment: "barbell",
      difficulty: "beginner",
      videoUrl: "https://youtu.be/LWdhO_OMrHk",
      instructions:
          "Stand up with your torso upright while holding a barbell at the wide outer handle. The palm of your hands should be facing forward. The elbows should be close to the torso. This will be your starting position. While holding the upper arms stationary, curl the weights forward while contracting the biceps as you breathe out. Tip: Only the forearms should move. Continue the movement until your biceps are fully contracted and the bar is at shoulder level. Hold the contracted position for a second and squeeze the biceps hard. Slowly begin to bring the bar back to starting position as your breathe in. Repeat for the recommended amount of repetitions.  Variations:  You can also perform this movement using an E-Z bar or E-Z attachment hooked to a low pulley. This variation seems to really provide a good contraction at the top of the movement. You may also use the closer grip for variety purposes."),
  MuscleExcercise(
      name: "Dumbbell Bench Press",
      type: "strength",
      muscle: "chest",
      equipment: "dumbbell",
      difficulty: "intermediate",
      videoUrl: "https://youtu.be/LWdhO_OMrHk",
      instructions:
          "Lie down on a flat bench with a dumbbell in each hand resting on top of your thighs. The palms of your hands will be facing each other. Then, using your thighs to help raise the dumbbells up, lift the dumbbells one at a time so that you can hold them in front of you at shoulder width. Once at shoulder width, rotate your wrists forward so that the palms of your hands are facing away from you. The dumbbells should be just to the sides of your chest, with your upper arm and forearm creating a 90 degree angle. Be sure to maintain full control of the dumbbells at all times. This will be your starting position. Then, as you breathe out, use your chest to push the dumbbells up. Lock your arms at the top of the lift and squeeze your chest, hold for a second and then begin coming down slowly. Tip: Ideally, lowering the weight should take about twice as long as raising it. Repeat the movement for the prescribed amount of repetitions of your training program.  Caution: When you are done, do not drop the dumbbells next to you as this is dangerous to your rotator cuff in your shoulders and others working out around you. Just lift your legs from the floor bending at the knees, twist your wrists so that the palms of your hands are facing each other and place the dumbbells on top of your thighs. When both dumbbells are touching your thighs simultaneously push your upper torso up (while pressing the dumbbells on your thighs) and also perform a slight kick forward with your legs (keeping the dumbbells on top of the thighs). By doing this combined movement, momentum will help you get back to a sitting position with both dumbbells still on top of your thighs. At this moment you can place the dumbbells on the floor. Variations: Another variation of this exercise is to perform it with the palms of the hands facing each other. Also, you can perform the exercise with the palms facing each other and then twisting the wrist as you lift the dumbbells so that at the top of the movement the palms are facing away from the body. I personally do not use this variation very often as it seems to be hard on my shoulders."),
  MuscleExcercise(
      name: "Pushups",
      type: "strength",
      muscle: "chest",
      equipment: "body_only",
      difficulty: "intermediate",
      videoUrl: "https://youtu.be/LWdhO_OMrHk",
      instructions:
          "Lie on the floor face down and place your hands about 36 inches apart while holding your torso up at arms length. Next, lower yourself downward until your chest almost touches the floor as you inhale. Now breathe out and press your upper body back up to the starting position while squeezing your chest. After a brief pause at the top contracted position, you can begin to lower yourself downward again for as many repetitions as needed.  Variations: If you are new at this exercise and do not have the strength to perform it, you can either bend your legs at the knees to take off resistance or perform the exercise against the wall instead of the floor. For the most advanced lifters, you can place your feet at a high surface such as a bench in order to increase the resistance and to target the upper chest more."),
  MuscleExcercise(
      name: "Triceps dip",
      type: "strength",
      muscle: "triceps",
      equipment: "body_only",
      difficulty: "intermediate",
      videoUrl: "https://youtu.be/LWdhO_OMrHk",
      instructions:
          "To get into the starting position, hold your body at arm's length with your arms nearly locked above the bars. Now, inhale and slowly lower yourself downward. Your torso should remain upright and your elbows should stay close to your body. This helps to better focus on tricep involvement. Lower yourself until there is a 90 degree angle formed between the upper arm and forearm. Then, exhale and push your torso back up using your triceps to bring your body back to the starting position. Repeat the movement for the prescribed amount of repetitions.  Variations: If you are new at this exercise and do not have the strength to perform it, use a dip assist machine if available. These machines use weight to help you push your bodyweight. Otherwise, a spotter holding your legs can help. More advanced lifters can add weight to the exercise by using a weight belt that allows the addition of weighted plates.")
];

//classes for workouts cards
class Trainer {
  String name;
  String description;
  String image;
  Trainer(this.name, this.description, this.image);
}

//dummy data for workouts page men
// List<Trainer> MEN_TRAINERS = [
//   Trainer(),
//   Trainer(),
//   Trainer(),
// ];

// List<Trainer> WOMEN_TRAINERS = [
//   Trainer(),
//   Trainer(),
//   Trainer(name, description, image)
// ];
