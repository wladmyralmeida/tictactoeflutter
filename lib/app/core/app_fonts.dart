import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/app/core/app_colors.dart';

class AppFonts {
  static var customtext = TextStyle(
      fontSize: 16.0, color: AppColors.white, fontWeight: FontWeight.normal);
  static var fontblack = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.black, letterSpacing: 3));
  static var fontWhite = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.white, letterSpacing: 3));
}
