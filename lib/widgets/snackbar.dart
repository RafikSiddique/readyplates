import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/utils/my_color.dart';

class MySnackBar {
  static GetBar myLoadingSnackBar({
    String title = '',
    required String message,
    int duration = 3,
    SnackPosition snackPosition = SnackPosition.TOP,
    Color color = Colors.white,
    Widget? icon,
  }) {
    return GetBar(
      titleText: Text(
        title,
        style: GoogleFonts.nunito(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          fontSize: 17,
          color: MyTheme.appbartextColor,
        ),
      ),
      messageText: Text(
        message,
        style: GoogleFonts.nunito(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          fontSize: 17,
          color: MyTheme.appbartextColor,
        ),
      ),
      duration: Duration(seconds: duration),
      snackPosition: snackPosition,
      backgroundColor: color,
      icon: icon,
    );
  }
}
