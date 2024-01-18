import 'dart:ffi';

import 'package:flutter/material.dart';

class AppColors {
  // Reddit Colors
  static const blackColor = Color.fromRGBO(1, 1, 1, 1); // primary color
  static const greyColor = Color.fromRGBO(26, 39, 45, 1); // secondary color
  static const drawerColor = Color.fromRGBO(18, 18, 18, 1);
  static const whiteColor = Colors.white;
  static var redColor = Colors.red.shade500;
  static var blueColor = Colors.blue.shade300;

  // Dark Theme
  static var darkModeAppTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: blackColor,
    hoverColor: blueColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: const ButtonStyle().copyWith(
        iconSize: MaterialStateProperty.all<double>(30),
        overlayColor:
            MaterialStateProperty.all<Color>(blackColor.withAlpha(10)),
        foregroundColor: MaterialStateProperty.all<Color>(whiteColor),
        backgroundColor: MaterialStateProperty.all<Color>(greyColor),
        textStyle:
            MaterialStateProperty.all<TextStyle>(TextStyle(color: blueColor)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: const ButtonStyle().copyWith(
        overlayColor:
            MaterialStateProperty.all<Color>(blackColor.withAlpha(10)),
        foregroundColor: MaterialStateProperty.all<Color>(whiteColor),
        textStyle:
            MaterialStateProperty.all<TextStyle>(TextStyle(color: blueColor)),
      ),
    ),
    cardColor: greyColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: blackColor,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: drawerColor,
    ),
    primaryColor: redColor,
    colorScheme: const ColorScheme.dark(background: drawerColor),
  );

  // light Theme
  static var lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: whiteColor,
    cardColor: greyColor,
    hoverColor: blueColor,
    textButtonTheme: TextButtonThemeData(
      style: const ButtonStyle().copyWith(
        overlayColor: MaterialStateProperty.all<Color>(redColor.withAlpha(100)),
        foregroundColor: MaterialStateProperty.all<Color>(whiteColor),
        textStyle:
            MaterialStateProperty.all<TextStyle>(TextStyle(color: blueColor)),
      ),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: blackColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: whiteColor,
    ),
    primaryColor: redColor,
    colorScheme: const ColorScheme.dark(background: whiteColor),
  );
}
