import 'package:flutter/material.dart';

import '../theme_model.dart';

class ActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = ThemeModel.of(context);
    final onAndroid = model.theme.platform == TargetPlatform.android;
    final darkMode = model.theme.brightness == Brightness.dark;
    return Row(
      children: [
        Text('Platform: Android'),
        Switch(
          onChanged: (value) => _onPlatformChanged(
                model,
                value ? TargetPlatform.iOS : TargetPlatform.android,
              ),
          value: onAndroid,
        ),
        Text('iOS'),
        Expanded(child: Container()),
        Text('Base Theme: Light'),
        Switch(
            onChanged: (value) => _onThemeBrightnessChanged(model, value),
            value: darkMode),
        Text('Dark'),
      ],
    );
    ;
  }

  _onPlatformChanged(ThemeModel model, TargetPlatform platform) =>
      model.updateTheme(model.theme.copyWith(platform: platform));

  _onThemeBrightnessChanged(ThemeModel model, bool darkMode) =>
      model.updateTheme(ThemeData.localize(
          darkMode ? ThemeData.dark() : ThemeData.light(),
          model.theme.textTheme));
}
