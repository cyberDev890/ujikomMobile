import 'package:flutter/material.dart';

import 'color_theme.dart';
import 'typography_theme.dart';

class DarkButtonsTheme {


  static ElevatedButtonThemeData elevatedButtonThemeData =
  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: TypographyTheme.buttonTextStyle,
      minimumSize: const Size.fromHeight(55),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  );

  static ElevatedButtonThemeData secondaryElevatedButtonThemeData =
  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: TypographyTheme.buttonTextStyle,
      minimumSize: const Size.fromHeight(50),
    ),
  );

  static OutlinedButtonThemeData outlinedButtonThemeData =
  OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: ColorsTheme.neutralColor[100],
      side: BorderSide(
        color: ColorsTheme.neutralColor[900] ?? ColorsTheme.neutralColor,
      ),
      minimumSize: const Size.fromHeight(50),
    ),
  );

  static TextButtonThemeData textButtonThemeData = TextButtonThemeData(
    style: TextButton.styleFrom(
      minimumSize: const Size.fromHeight(40),
    ),
  );
}