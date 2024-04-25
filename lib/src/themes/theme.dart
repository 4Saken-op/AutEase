import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class AppTheme1 {
  AppTheme1._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.pink,
    // textTheme: TextTheme(
    //     headlineMedium: GoogleFonts.montserrat(color: Colors.black87),
    //     titleMedium:
    //         GoogleFonts.poppins(color: Colors.black54, fontSize: 24))
  );

  static ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
}
