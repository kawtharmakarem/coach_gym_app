import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../resources/assets_manager.dart';
import '../dummy_data.dart';

import '../../resources/color_manager.dart';

class ExcercisesPage extends StatefulWidget {
  const ExcercisesPage({super.key});

  @override
  State<ExcercisesPage> createState() => _ExcercisesPageState();
}

class _ExcercisesPageState extends State<ExcercisesPage> {
  late String excerciseTitle;
  late String excerciseId;

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    excerciseId = routeArg['id']!;
    excerciseTitle = routeArg['title']!;
    final muscleExcercise = DUMMY_EXCERCISES
        .where((excercise) => excercise.muscle == excerciseTitle.toLowerCase())
        .toList();
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
            title: Text(
              excerciseTitle,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
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
        body: ListView.builder(
            itemCount: muscleExcercise.length,
            itemBuilder: (context, index) {
              return MuscleExcerciseItem(
                muscle: muscleExcercise[index].muscle,
                image: ImageAssets.legtrain,
                name: muscleExcercise[index].name,
              );
            }));
  }
}
