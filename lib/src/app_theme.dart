import 'package:flutter/material.dart';

const primarySwatch = Colors.blueGrey;

final panacheTheme = ThemeData.localize(
  ThemeData(
    primarySwatch: primarySwatch,
    textTheme: Typography.blackCupertino.copyWith(
      subtitle: Typography.blackCupertino.subtitle
          .copyWith(color: primarySwatch.shade400),
      title: Typography.blackCupertino.title
          .copyWith(color: primarySwatch.shade300),
      headline:
          Typography.blackCupertino.headline.copyWith(color: primarySwatch),
    ),
    primaryIconTheme: IconThemeData.fallback().copyWith(color: Colors.yellow),
  ),
  Typography.blackCupertino,
);
