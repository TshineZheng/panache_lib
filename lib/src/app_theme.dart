import 'package:flutter/material.dart';

const primarySwatch = Colors.blueGrey;

final panacheTheme = ThemeData.localize(
  ThemeData(
    primarySwatch: primarySwatch,
    textTheme: Typography.blackCupertino.copyWith(
      body1: Typography.blackCupertino.body1.copyWith(fontSize: 12),
      body2: Typography.blackCupertino.body2.copyWith(fontSize: 12),
      subtitle: Typography.blackCupertino.subtitle
          .copyWith(color: primarySwatch.shade400, fontSize: 12),
      title: Typography.blackCupertino.title
          .copyWith(color: primarySwatch.shade300),
      headline:
          Typography.blackCupertino.headline.copyWith(color: primarySwatch),
    ),
    primaryIconTheme: IconThemeData.fallback().copyWith(color: Colors.yellow),
  ),
  Typography.blackCupertino,
);
