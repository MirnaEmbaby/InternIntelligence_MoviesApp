import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/shared/styles/colors.dart';

ThemeData myTheme = ThemeData(
  focusColor: defPink,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink),
  textTheme: TextTheme(
    bodySmall: GoogleFonts.poppins(
      color: defWhite,
      fontSize: 14,
    ),
    headlineMedium: GoogleFonts.poppins(
      color: defWhite,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: GoogleFonts.poppins(
      color: defWhite,
      fontSize: 18,
      fontWeight: FontWeight.w800,
    ),
    labelLarge: GoogleFonts.poppins(
      color: defWhite,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: GoogleFonts.poppins(
      color: defWhite,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: GoogleFonts.poppins(
      color: defWhite,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
  ),
  primarySwatch: Colors.pink,
  hintColor: defWhite,
  inputDecorationTheme: InputDecorationTheme(
    suffixIconColor: defWhite,
    hintStyle: GoogleFonts.poppins(
      color: defWhite,
      fontSize: 14,
    ),
  ),
  primaryColor: defPink,
);
