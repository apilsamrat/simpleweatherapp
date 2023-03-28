import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simpleweatherapp/utilities/colors.dart';


ThemeData theme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    appBarTheme: appBarTheme,
    iconTheme: iconThemeData,
    progressIndicatorTheme: progressIndicatorThemeData,
    scaffoldBackgroundColor: Colors.white);

ProgressIndicatorThemeData progressIndicatorThemeData =
    ProgressIndicatorThemeData(
  linearTrackColor: grey200,
  color: primaryColor,
  linearMinHeight: 7,
);

IconThemeData iconThemeData = IconThemeData(
  color: primaryColor,
);

AppBarTheme appBarTheme = AppBarTheme(
  systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.white),
  titleTextStyle: GoogleFonts.urbanist(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: const Color(0XFF0F0E13),
      height: 1.5),
  foregroundColor: primaryBlack,
  backgroundColor: Colors.white,
  elevation: 0,
);
