import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simpleweatherapp/utilities/colors.dart';

ButtonStyle primaryButtonStyle = ButtonStyle(
  backgroundColor: MaterialStatePropertyAll(primaryColor),
  foregroundColor: const MaterialStatePropertyAll(Colors.white),
  shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
  textStyle: MaterialStatePropertyAll(GoogleFonts.urbanist(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  )),
);

ButtonStyle primaryTransparentButtonStyle = ButtonStyle(
  backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
  foregroundColor: MaterialStatePropertyAll(primaryColor),
  shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
  textStyle:
      MaterialStatePropertyAll(GoogleFonts.urbanist(color: Colors.white)),
);
