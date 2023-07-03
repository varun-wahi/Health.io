import 'dart:ui';
import 'package:flutter/material.dart';

TextStyle style1(
    {double size = 21,
    String family = 'Poppins',
    FontStyle style = FontStyle.normal,
    FontWeight fontWeight = FontWeight.normal,
    Color fontColor = Colors.black}) {
  return TextStyle(
      fontFamily: family,
      fontSize: size,
      color: fontColor,
      fontWeight: fontWeight,
      fontStyle: style);
}
