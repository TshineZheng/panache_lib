import 'package:flutter/material.dart';
import 'package:flutterial_components/src/editor/controls/color_selector.dart';

import '../theme_model.dart';

class ActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = ThemeModel.of(context);
    print('ActionBar.build... brightness ${model.theme.brightness}');
    //final onAndroid = model.theme.platform == TargetPlatform.android;
    final isDark = model.theme.brightness == Brightness.dark;
    return Row(
      children: [
        Expanded(
          child: ColorSelector('Primary swatch', model.theme.primaryColor,
              (color) => _onSwatchSelection(model, color)),
        ),
        Text('Brightness : Light'),
        Switch(
            onChanged: (value) => _onThemeBrightnessChanged(model, value),
            value: isDark),
        Text('Dark'),
        /*Text('Platform: Android'),
        Switch(
          onChanged: (value) => _onPlatformChanged(
                model,
                value ? TargetPlatform.iOS : TargetPlatform.android,
              ),
          value: onAndroid,
        ),
        Text('iOS'),*/
      ],
    );
    ;
  }

  /*void _onPlatformChanged(ThemeModel model, TargetPlatform platform) =>
      model.updateTheme(model.theme.copyWith(platform: platform));*/

  void _onThemeBrightnessChanged(ThemeModel model, bool isDark) =>
      model.updateTheme(ThemeData.localize(
          ThemeData(
              primarySwatch: model.theme.primaryColor,
              brightness: isDark ? Brightness.dark : Brightness.light),
          model.theme.textTheme));

  void _onSwatchSelection(ThemeModel model, MaterialColor swatch) {
    model.initTheme(primarySwatch: swatch, brightness: model.theme.brightness);
  }
}
