import 'package:flutter/material.dart';

import '../theme_model.dart';
import '../utils/color_utils.dart';
import 'controls/brightness_control.dart';
import 'controls/color_selector.dart';

class GlobalThemePropertiesControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = ThemeModel.of(context);
    //final onAndroid = model.theme.platform == TargetPlatform.android;
    final isDark = model.theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: ColorSelector(
              'Primary swatch',
              model.theme.primaryColor,
              (color) => _onSwatchSelection(model, color),
              padding: 0,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          BrightnessSelector(
            isDark: isDark,
            label: 'Brightness',
            onBrightnessChanged: (value) =>
                _onThemeBrightnessChanged(model, value),
          ),
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
      ),
    );
  }

  /*void _onPlatformChanged(ThemeModel model, TargetPlatform platform) =>
      model.updateTheme(model.theme.copyWith(platform: platform));*/

  void _onThemeBrightnessChanged(ThemeModel model, Brightness brightness) =>
      model.updateTheme(ThemeData.localize(
          ThemeData(
              primarySwatch: model.primarySwatch ??
                  swatchFor(color: model.theme.primaryColor),
              brightness: brightness),
          model.theme.textTheme));

  void _onSwatchSelection(ThemeModel model, MaterialColor swatch) {
    model.updateTheme(ThemeData.localize(
        ThemeData(primarySwatch: swatch, brightness: model.theme.brightness),
        model.theme.textTheme));
    //model.newTheme(primarySwatch: swatch, brightness: model.theme.brightness);
  }
}
