import 'package:flutter/cupertino.dart';

double responsiveFontSize(BuildContext context, double fontSize) {
  final screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth < 600) {
    return fontSize;
  } else if (screenWidth < 1200) {
    return fontSize * 1.2;
  } else {
    return fontSize * 1.5;
  }
}
