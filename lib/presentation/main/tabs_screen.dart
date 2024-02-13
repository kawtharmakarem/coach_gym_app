import 'package:coach_gym_app/presentation/main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'pages/excercises.dart';
import 'pages/progress.dart';
import 'pages/settings.dart';
import 'pages/workouts.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {'page': MainView(), 'label': AppStrings.excercises},
    {'page': WorkoutsPage(), 'label': AppStrings.workouts},
    {'page': ProgressPage(), 'label': AppStrings.progress},
    {'page': SettingsPage(), 'label': AppStrings.settings},
  ];
  int _selectedPageIndex = 0;
  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['label'],
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: ColorManager.white,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        backgroundColor: ColorManager.boardingColor,
        selectedItemColor: ColorManager.primary.withOpacity(0.5),
        iconSize: AppSize.s35.r,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: getMediumStyle(
            color: ColorManager.black,
            fontFamily: FontFamilies.fontFamilyRubik),
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                ImageAssets.exercise,
              ),
              label: AppStrings.excercises),
          BottomNavigationBarItem(
              icon: Image.asset(
                ImageAssets.calendar,
              ),
              label: AppStrings.workouts),
          BottomNavigationBarItem(
              icon: Image.asset(
                ImageAssets.progress,
              ),
              label: AppStrings.progress),
          BottomNavigationBarItem(
              icon: Image.asset(
                ImageAssets.settings,
              ),
              label: AppStrings.settings)
        ],
      ),
      body: _pages[_selectedPageIndex]['page'],
    );
  }
}
