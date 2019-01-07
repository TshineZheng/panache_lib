import 'dart:io';

import 'package:flutter/material.dart';

import '../models.dart';

class ScreenshotRenderer extends StatelessWidget {
  final PanacheTheme theme;
  final String basePath;
  final ValueChanged<PanacheTheme> onThemeSelection;

  const ScreenshotRenderer(
      {Key key,
      @required this.theme,
      @required this.basePath,
      this.onThemeSelection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenshotPath = '$basePath/${theme.id}.png';
    final imageFile = File(screenshotPath);

    return InkWell(
      onTap: () => onThemeSelection(theme),
      child: Container(
        /*decoration: BoxDecoration(boxShadow: BoxShadow()),*/
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Material(
            elevation: 2.0,
            child: imageFile.existsSync()
                ? Image.file(imageFile, height: 250)
                : SizedBox(width: 140, child: Icon(Icons.color_lens))),
      ),
    );
  }
}
