import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData myTheme = ThemeData(
  fontFamily: 'PlayfairDisplay',
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: AppColors.bodyColorWhite),
    bodyLarge: TextStyle(color: AppColors.bodyColorBlack),
  ),
);
