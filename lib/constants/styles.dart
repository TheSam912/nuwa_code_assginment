import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/font_size_helper.dart';
import 'colors.dart';

class TextStyles {
  static TextStyle headline(BuildContext context) {
    return GoogleFonts.poppins(
      color: tTextColor,
      fontSize: responsiveFontSize(context, 16),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle subHeadline(BuildContext context) {
    return GoogleFonts.poppins(
      color: tTextColor,
      fontSize: responsiveFontSize(context, 14),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle custom({
    required BuildContext context,
    Color color = tTextColor,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: responsiveFontSize(context, fontSize),
      fontWeight: fontWeight,
    );
  }
}
