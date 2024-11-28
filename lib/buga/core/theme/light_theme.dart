import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData lighMode = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColor.primaryColor,
        onPrimary: Colors.black,
        secondary: AppColor.secondaryColor,
        tertiary: Colors.white,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        surface: Colors.grey.shade100,
        onSurface: Colors.grey.shade700));
