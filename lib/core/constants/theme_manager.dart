import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/core/constants/color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: ColorManager.primary,
          onPrimary: ColorManager.textGrey,
          secondary: ColorManager.brown,
          onSecondary: ColorManager.cream,
          error: const Color.fromARGB(255, 114, 11, 3),
          onError: const Color.fromARGB(255, 114, 11, 3),
          background: ColorManager.grey,
          onBackground: ColorManager.darkGrey,
          surface: Colors.white,
          onSurface: Colors.black),
      disabledColor: ColorManager.primary,
      textTheme: TextTheme(
        bodyMedium: GoogleFonts.abhayaLibre(
          color: Colors.black,
          fontSize: 34.3,
        ),
        bodySmall: GoogleFonts.roboto(
          fontWeight: FontWeight.w600,
          color: Colors.black.withOpacity(0.72),
        ),
        headlineMedium: GoogleFonts.archivoBlack(
          color: Colors.black,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: ColorManager.grey.withOpacity(0.9),
        surfaceTintColor: ColorManager.textGrey,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 20,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          splashColor: Colors.black.withOpacity(0.6)));
}
