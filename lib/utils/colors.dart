import 'package:flutter/material.dart';

// const kColorPrimary = Color(0xffFA6700);
const kColorPrimary = Color(0xff64BF70);//yellow
const kColorPrimaryLight = Color(0xff7FC44F);//yellow
const kColorPrimaryDark = Color(0xFF58BD81);
const kColorAccent = Color(0xFF01A552);
const kColorBlueLight = Color(0xFFA1BCFF);
const kColorAsh = Color(0xFFB2B2B2);
const kColorTextGrey = Color(0xFF777a95);
const kColorRed = Color(0xFFEB1555);
const kColorDarkBlue = Color(0xff464B4F);
const kColorBlueBlack = Color(0xff211F21);
const kColorAshLight2 = Color(0xffD2DAE2);

const List<Color> colorsRanges = [
  Color(0xFF5E97F6),
  Color(0xFF9E9E9E),
  Color(0xFF9CCC65),
  Color(0xFFD93025),
  Color(0xFFFFA726),
  Color(0xFFA1887F),
  Color(0xFF9FA8DA),
  Color(0xFF4DD0E1),
  Color(0xFF9575CD),
];

Map<int, Color> colorSwatch = {
  50: Color.fromRGBO(0, 52, 154, .1),
  100: Color.fromRGBO(0, 52, 154, .2),
  200: Color.fromRGBO(0, 52, 154, .3),
  300: Color.fromRGBO(0, 52, 154, .4),
  400: Color.fromRGBO(0, 52, 154, .5),
  500: Color.fromRGBO(0, 52, 154, .6),
  600: Color.fromRGBO(0, 52, 154, .7),
  700: Color.fromRGBO(0, 52, 154, .8),
  800: Color.fromRGBO(0, 52, 154, .9),
  900: Color.fromRGBO(0, 52, 154, 1),
};


Color gradientColorStart = kColorPrimary;
Color gradientColorMid = Colors.black.withOpacity(.7);
Color gradientColorEnd = Colors.black.withOpacity(.8);
Gradient kFabGradient = LinearGradient(
    colors: [gradientColorStart, gradientColorEnd, ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);

class ColorUtil{

  static LinearGradient gradient({List<Color> colors, AlignmentGeometry startAlignment,  AlignmentGeometry endAlignment, }){
    return LinearGradient(
        colors: colors,
        begin: startAlignment??Alignment.center,
        end: endAlignment??Alignment.bottomRight);
  }
}
