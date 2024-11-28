import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColor.primaryColor,
        tertiary: Colors.grey.shade900,
        onPrimary: Colors.black,
        secondary: AppColor.secondaryColor,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        surface: Colors.black,
        onSurface: Colors.white));
