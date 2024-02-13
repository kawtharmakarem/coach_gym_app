import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:image_picker/image_picker.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:toggle_switch/toggle_switch.dart';

Widget customElevatedButton(
    {required void Function() onPressed,
    required Color textColor,
    required Color backgroundColor,
    required String text}) {
  return SizedBox(
    width: AppSize.s277.w,
    height: AppSize.s39.h,
    child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          side: BorderSide(color: ColorManager.primary, width: AppSize.s1.w),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s20.r)),
        ),
        child: Text(
          text,
          style: getMediumStyle(
              color: textColor, fontFamily: FontFamilies.fontFamilyRubik),
        )),
  );
}

Widget rectangleElevatedButton(
    {required void Function() onPressed,
    required Color backgroundColor,
    required String text,
    required Color textColor}) {
  return SizedBox(
    width: AppSize.s350.w,
    height: AppSize.s50.h,
    child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            side: BorderSide(color: ColorManager.primary, width: AppSize.s1.w),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s6.r))),
        child: Text(
          text,
          style: getMediumStyle(
              color: textColor, fontFamily: FontFamilies.fontFamilyRubik),
        )),
  );
}

Widget customTextFormField({
  required String hintText,
}) {
  return TextFormField(
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      filled: true,
      fillColor: ColorManager.white,
      hintText: hintText,
      hintStyle: getRegularStyle(
          fontSize: FontSize.s15.sp,
          color: ColorManager.hintClr,
          fontFamily: FontFamilies.fontFamilyRubik),
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.borderClr, width: AppSize.s1.w),
        borderRadius: BorderRadius.circular(AppSize.s6.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1.w),
        borderRadius: BorderRadius.circular(AppSize.s6.r),
      ),
      errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.errorClr, width: AppSize.s1.w),
          borderRadius: BorderRadius.circular(AppSize.s6.r)),
    ),
  );
}

Widget customText({required double fontSize, required String text}) {
  return Text(
    text,
    style: getRegularStyle(
        fontSize: fontSize,
        color: ColorManager.black,
        fontFamily: FontFamilies.fontFamilyRubik),
  );
}

Widget customTitleText({required double fontSize, required String text}) {
  return Text(text,
      style: getMediumStyle(
          fontSize: fontSize,
          color: ColorManager.black,
          fontFamily: FontFamilies.fontFamilyRubik));
}

Widget customTextButton({
  required void Function() onPressed,
  required String text,
  required Color color,
}) {
  return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: getRegularStyle(
            fontSize: FontSize.s10.sp,
            color: color,
            fontFamily: FontFamilies.fontFamilyRubik),
      ));
}

class ProfileImage extends StatelessWidget {
  final File image;
  final ValueChanged<ImageSource> onClicked;
  const ProfileImage({super.key, required this.image, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      children: [
        buildImage(context),
        Positioned(
            bottom: AppSize.s0.h,
            right: AppSize.s4.w,
            child: buildEditIcon(ColorManager.white))
      ],
    ));
  }

  Widget buildImage(BuildContext context) {
    final imagePath = this.image.path;
    final image = imagePath.contains('http://')
        ? NetworkImage(imagePath)
        : FileImage(File(imagePath));
    return ClipOval(
        child: Material(
      color: ColorManager.transparent,
      child: Ink.image(
          image: image as ImageProvider,
          fit: BoxFit.cover,
          width: AppSize.s117.w,
          height: AppSize.s117.h,
          child: InkWell(
            onTap: () async {
              final source = await showImageSource(context);
              if (source == null) return;
              onClicked(source);
            },
          )),
    ));
  }

  Future<ImageSource?> showImageSource(BuildContext context) async {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text(AppStrings.camera),
                  onTap: () => Navigator.of(context).pop(ImageSource.camera),
                ),
                ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text(AppStrings.gallery),
                  onTap: () => Navigator.of(context).pop(ImageSource.gallery),
                )
              ],
            ));
  }

  Widget buildEditIcon(Color color) {
    return ClipOval(
      child: Container(
        color: ColorManager.primary,
        padding: const EdgeInsets.all(AppPadding.p2),
        child: Icon(
          Icons.add,
          color: color,
          size: AppSize.s20.r,
        ),
      ),
    );
  }
}

//onboarding info methods
Widget buildGenderQues() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(height: AppSize.s65.h),
      //Row female and gmail
      const CustomGenderRadioButton()
    ],
  );
}

Widget buildHeightQues() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        height: AppSize.s124.h,
      ),
      Container(
          width: AppSize.s290.w,
          height: AppSize.s50.h,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(AppSize.s6.r)),
          child: customTextFormField(hintText: AppStrings.onBoardingInfoQuiz2))
    ],
  );
}

Widget buildWeightQues() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        height: AppSize.s124.h,
      ),
      Container(
          width: AppSize.s290.w,
          height: AppSize.s50.h,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(AppSize.s6.r)),
          child: customTextFormField(hintText: AppStrings.onBoardingInfoQuiz3))
    ],
  );
}

class BuildAgeQues extends StatefulWidget {
  const BuildAgeQues({super.key});

  @override
  State<BuildAgeQues> createState() => _BuildAgeQuesState();
}

class _BuildAgeQuesState extends State<BuildAgeQues> {
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: AppSize.s124.h,
        ),
        //text form field with date
        TextFormField(
          onTap: () async {
            DateTime date = DateTime(2020);
            FocusScope.of(context).requestFocus(FocusNode());
            date = (await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2050)))!;
            dateController.text = date.toIso8601String();
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(AppPadding.p8),
            filled: true,
            fillColor: ColorManager.white,
            hintText: AppStrings.onBoardingInfoQuiz4,
            hintStyle: getRegularStyle(
                fontSize: FontSize.s15.sp,
                color: ColorManager.hintClr,
                fontFamily: FontFamilies.fontFamilyRubik),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: ColorManager.borderClr, width: AppSize.s1.w),
              borderRadius: BorderRadius.circular(AppSize.s30.r),
            ),
          ),
        )
      ],
    );
  }
}

Widget buildFitnessQues() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        height: AppSize.s80.h,
      ),
      CustomFitnessRadioButton()
    ],
  );
}

class CustomFitnessRadioButton extends StatefulWidget {
  const CustomFitnessRadioButton({super.key});
  @override
  State<CustomFitnessRadioButton> createState() =>
      _CustomFitnessRadioButtonState();
}

class _CustomFitnessRadioButtonState extends State<CustomFitnessRadioButton> {
  int groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customListTile(
          context,
          AppStrings.beginners,
          AppStrings.subbeginners,
          ImageAssets.beginner,
          Radio(
              value: 1,
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = value!;
                });
              }),
        ),
        customListTile(
          context,
          AppStrings.intermediate,
          AppStrings.subintermediate,
          ImageAssets.intermediate,
          Radio(
              value: 2,
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = value!;
                });
              }),
        ),
        customListTile(
          context,
          AppStrings.advanced,
          AppStrings.subadvanced,
          ImageAssets.advancement,
          Radio(
              value: 3,
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = value!;
                });
              }),
        )
      ],
    );
  }

  Card customListTile(BuildContext context, String title, String subTitle,
      String image, Widget child) {
    return Card(
      child: ListTile(
          tileColor: ColorManager.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s6.r)),
          title: customText(fontSize: FontSize.s15.sp, text: title),
          subtitle:
              Text(subTitle, style: Theme.of(context).textTheme.labelMedium),
          leading: GFAvatar(
            backgroundColor: ColorManager.primary,
            shape: GFAvatarShape.square,
            size: AppSize.s40.r,
            borderRadius: BorderRadius.circular(AppSize.s6.r),
            backgroundImage:
                Image.asset(image, width: AppSize.s15.w, height: AppSize.s15.h)
                    .image,
          ),
          trailing: child),
    );
  }
}

class CustomGenderRadioButton extends StatefulWidget {
  const CustomGenderRadioButton({super.key});

  @override
  State<CustomGenderRadioButton> createState() =>
      _CustomGenderRadioButtonState();
}

class _CustomGenderRadioButtonState extends State<CustomGenderRadioButton> {
  int groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Stack(
              children: [
                Container(
                    width: AppSize.s85.w,
                    height: AppSize.s70.h,
                    decoration: BoxDecoration(
                        color: groupValue == 1
                            ? ColorManager.primary.withOpacity(0.7)
                            : ColorManager.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(AppSize.s35.r),
                            topLeft: Radius.circular(AppSize.s6.r),
                            topRight: Radius.circular(AppSize.s6.r),
                            bottomRight: Radius.circular(AppSize.s6.r))),
                    child: Center(child: Image.asset(ImageAssets.male))),
                Positioned(
                  bottom: AppSize.s4.h,
                  left: AppSize.s4.w,
                  child: Radio(
                      value: 1,
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value!;
                        });
                      }),
                ),
              ],
            ),
            SizedBox(height: AppSize.s40.h),
            customText(fontSize: FontSize.s24.sp, text: AppStrings.male)
          ],
        ),
        SizedBox(width: AppSize.s60.w),
        Column(
          children: [
            Stack(
              children: [
                Container(
                    width: AppSize.s85.w,
                    height: AppSize.s70.h,
                    decoration: BoxDecoration(
                        color: groupValue == 2
                            ? ColorManager.primary.withOpacity(0.7)
                            : ColorManager.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(AppSize.s6.r),
                            topLeft: Radius.circular(AppSize.s6.r),
                            topRight: Radius.circular(AppSize.s35.r),
                            bottomRight: Radius.circular(AppSize.s6.r))),
                    child: Center(child: Image.asset(ImageAssets.female))),
                Positioned(
                  bottom: AppSize.s4.h,
                  left: AppSize.s4.w,
                  child: Radio(
                      value: 2,
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value!;
                        });
                      }),
                ),
              ],
            ),
            SizedBox(height: AppSize.s40.h),
            customText(fontSize: FontSize.s24.sp, text: AppStrings.female)
          ],
        ),
      ],
    );
  }
}

class CustomDropdownButtom extends StatefulWidget {
  const CustomDropdownButtom({super.key});

  @override
  State<CustomDropdownButtom> createState() => _CustomDropdownButtomState();
}

class _CustomDropdownButtomState extends State<CustomDropdownButtom> {
  _CustomDropdownButtomState() {
    _selectedVal = _items[0];
  }

  final _items = ['value1', 'value2', 'value3'];
  String? _selectedVal = 'value1';
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: _items.map((item) {
        return DropdownMenuItem(value: item, child: Text(item));
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedVal = value as String;
        });
      },
    );
  }
}

class CustomDropdownButtonFormField extends StatefulWidget {
  final String hintText;
  const CustomDropdownButtonFormField({super.key, required this.hintText});

  @override
  State<CustomDropdownButtonFormField> createState() =>
      _CustomDropdownButtonFormFieldState();
}

class _CustomDropdownButtonFormFieldState
    extends State<CustomDropdownButtonFormField> {
  _CustomDropdownButtonFormFieldState() {
    _selectedVal = _items[0];
  }

  final _items = ['value1', 'value2', 'value3'];
  String? _selectedVal = 'value1';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.borderClr, width: AppSize.s1.w),
        borderRadius: BorderRadius.circular(AppSize.s6.r),
        color: ColorManager.white,
      ),
      width: AppSize.s290.w,
      height: AppSize.s50.h,
      child: DropdownButtonFormField(
        value: _selectedVal,
        icon: Icon(Icons.arrow_drop_down_circle_outlined,
            color: ColorManager.hintClr),
        iconSize: AppSize.s20.r,
        hint: Text(
          widget.hintText,
          style: getRegularStyle(
              fontSize: FontSize.s15.sp,
              color: ColorManager.hintClr,
              fontFamily: FontFamilies.fontFamilyRubik),
        ),
        items: _items.map((item) {
          return DropdownMenuItem(
            child: Text(item),
            value: item,
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _selectedVal = value as String;
          });
        },
      ),
    );
  }
}

//toggleswich
class CustomToggleSwitch extends StatelessWidget {
  CustomToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      labels: const [AppStrings.men, AppStrings.women],
      initialLabelIndex: 1,
      totalSwitches: 2,
      fontSize: FontSize.s18.sp,
      minWidth: AppSize.s360.w,
      minHeight: AppSize.s40.h,
      activeBgColor: [ColorManager.primary, ColorManager.lightBlue],
      inactiveBgColor: ColorManager.inactiveToggle,
      activeFgColor: ColorManager.white,
      inactiveFgColor: ColorManager.inactivefrToggle,
      cornerRadius: AppSize.s6.r,
    );
  }
}
