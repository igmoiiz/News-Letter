import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//  light Mode
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  fontFamily: GoogleFonts.outfit().fontFamily,
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    surface: Color(0xFFdfd3c3),
    primary: Color(0xFF7d6d83),
    onPrimary: Color(0xFF000000),
    secondary: Color(0xFFd1b9a9),
    tertiary: Color(0xFFa84d7a),
    inversePrimary: Color(0xFF000000),
  ),
);

//  dark Mode
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  fontFamily: GoogleFonts.outfit().fontFamily,
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    surface: Color.fromARGB(255, 8, 8, 8),
    primary: Color(0xFF6A1E55),
    secondary: Color(0xFFDEDCFF),
    onPrimary: Color(0xFFffeeee),
    tertiary: Color(0xFFA64D79),
    inversePrimary: Color(0xFF000000),
  ),
);
