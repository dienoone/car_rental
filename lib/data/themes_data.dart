import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightModeTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: const Color(0xffF8F8F8),
  primaryColor: Colors.black,
  secondaryHeaderColor: const Color(0xff070606), // This matches your details page theme
  textTheme: TextTheme(
    bodyMedium: GoogleFonts.poppins(color: Colors.black),
  ),
  cardColor: const Color(0xffF3F3F3), // Updated card color to match details page container
  scaffoldBackgroundColor: const Color(0xffF8F8F8),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color(0xffF8F8F8),
    titleTextStyle: GoogleFonts.poppins(color: Colors.black),
    iconTheme: const IconThemeData(color: Colors.black),
  ),
  iconTheme: const IconThemeData(color: Colors.black),
);

ThemeData darkModeTheme = ThemeData(
  brightness: Brightness.dark,
  backgroundColor: const Color(0xff06090D),
  primaryColor: Colors.white,
  secondaryHeaderColor: Colors.white,
  textTheme: TextTheme(
    bodyText2: GoogleFonts.poppins(color: Colors.white),
  ),
  cardColor: const Color(0xff070606), // Same card color as your details page dark mode
  scaffoldBackgroundColor: const Color(0xff06090D),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color(0xff06090D),
    titleTextStyle: GoogleFonts.poppins(color: Colors.white),
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
);
