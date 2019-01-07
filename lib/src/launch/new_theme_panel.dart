import 'package:flutter/material.dart';
import 'package:panache_lib/src/utils/color_utils.dart';

import '../editor/controls/brightness_control.dart';
import '../editor/controls/color_selector.dart';

class NewThemePanel extends StatelessWidget {
  final ColorSwatch newThemePrimary;

  final Brightness initialBrightness;

  final ValueChanged<ColorSwatch> onSwatchSelection;

  final ValueChanged<Brightness> onBrightnessSelection;
  final VoidCallback onNewTheme;

  bool get isDark => initialBrightness == Brightness.dark;

  const NewThemePanel({
    Key key,
    @required this.newThemePrimary,
    @required this.initialBrightness,
    @required this.onSwatchSelection,
    @required this.onBrightnessSelection,
    @required this.onNewTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.white54,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text('New theme', style: textTheme.title),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                  child: ColorSelector('Primary swatch', newThemePrimary,
                      (color) => onSwatchSelection(swatchFor(color: color)))),
              SizedBox(width: 10),
              BrightnessSelector(
                isDark: isDark,
                label: 'Brightness',
                onBrightnessChanged: onBrightnessSelection,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: RaisedButton.icon(
              shape: StadiumBorder(),
              color: newThemePrimary,
              icon: Icon(Icons.color_lens, color: newThemePrimary[100]),
              label: Text('Customize', style: TextStyle(color: Colors.white)),
              onPressed: onNewTheme,
            ),
          )
        ],
      ),
    );
  }
}
