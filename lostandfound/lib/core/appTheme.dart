import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color appColor = Color(0xFF055EEE);
  static TextStyle heading = GoogleFonts.getFont(
    'Nunito',
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 38,
  );
  static TextStyle body = GoogleFonts.getFont(
    'Nunito',
    color: Colors.black,
    fontWeight: FontWeight.normal,
    fontSize: 16,
  );
}
