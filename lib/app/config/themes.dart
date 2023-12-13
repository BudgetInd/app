import 'package:budgetin/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    appBarTheme: appBarTheme(),
    // scaffoldBackgroundColor: bgColor,
    // inputDecorationTheme: inputDecorationTheme(),
    // visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ThemeData darkTheme() {
  return ThemeData(
    fontFamily: 'Poppins',
    appBarTheme: appBarTheme(),
    brightness: Brightness.dark,
    // scaffoldBackgroundColor: bgColor,
    // inputDecorationTheme: inputDecorationTheme(),
    // visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    elevation: 0,
    color: appBarColor,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ),
  );
}

// Input decoration theme
InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    gapPadding: 10,
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: kTextColor),
  );
  return InputDecorationTheme(
    border: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 42,
      vertical: 20,
    ),
  );
}
