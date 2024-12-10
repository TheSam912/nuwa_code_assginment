import 'package:flutter/material.dart';

double sketchSize(context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth < 600) {
    return screenHeight * 0.3;
  } else if (screenWidth < 1200) {
    return screenHeight * 0.4;
  } else {
    return screenHeight * 0.5;
  }
}
