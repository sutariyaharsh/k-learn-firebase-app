import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.montserrat(
      color: Colors.black87,
    ),
    titleMedium: GoogleFonts.poppins(
      color: Colors.black45,
      fontSize: 30,
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.montserrat(
      color: Colors.white,
    ),
    titleMedium: GoogleFonts.poppins(
      color: Colors.white30,
      fontSize: 30,
    ),
  );
}