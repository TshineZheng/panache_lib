import 'package:flutter/material.dart';
import 'package:flutterial_components/src/editor/controls/color_selector.dart';
import 'package:flutterial_components/src/editor/controls/font_size_slider.dart';
import 'package:flutterial_components/src/theme_model.dart';

import '../../constants.dart';

class TypographyThemePanel extends StatelessWidget {
  final ThemeModel model;

  ThemeData get theme => model.theme;

  const TypographyThemePanel(this.model, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding,
      child: Column(
        children: _buildTextThemeEditorFields(model),
      ),
    );
  }

  List<Widget> _buildTextThemeEditorFields(ThemeModel model) {
    final txtTheme = theme.textTheme;
    final body1 = txtTheme.body1;
    final body2 = txtTheme.body2;
    final headline = txtTheme.headline;
    final subhead = txtTheme.subhead;
    final title = txtTheme.title;
    final button = txtTheme.button;
    final display1 = txtTheme.display1;
    final display2 = txtTheme.display2;
    final display3 = txtTheme.display3;
    final display4 = txtTheme.display4;

    return [
      _getTextThemeForm(
        'Body 1',
        colorValue: body1.color,
        fontSize: body1.fontSize ?? 24,
        isBold: body1.fontWeight == FontWeight.bold,
        isItalic: body1.fontStyle == FontStyle.italic,
        onColorChanged: (c) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(body1: body1.copyWith(color: c)));
          model.updateTheme(updatedTheme);
        },
        onSizeChanged: (s) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(body1: body1.copyWith(fontSize: s)));
          model.updateTheme(updatedTheme);
        },
        onWeightChanged: (v) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(
                  body1: body1.copyWith(
                      fontWeight: v ? FontWeight.bold : FontWeight.normal)));
          model.updateTheme(updatedTheme);
        },
        onFontStyleChanged: (v) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(
                  body1: body1.copyWith(
                      fontStyle: v ? FontStyle.italic : FontStyle.normal)));
          model.updateTheme(updatedTheme);
        },
      ),
      _getTextThemeForm(
        'Body 2',
        colorValue: body2.color,
        fontSize: body2.fontSize,
        isBold: body2.fontWeight == FontWeight.bold,
        isItalic: body2.fontStyle == FontStyle.italic,
        onColorChanged: (c) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(body2: body2.copyWith(color: c)));
          model.updateTheme(updatedTheme);
        },
        onSizeChanged: (s) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(body2: body2.copyWith(fontSize: s)));
          model.updateTheme(updatedTheme);
        },
        onWeightChanged: (v) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(
                  body2: body2.copyWith(
                      fontWeight: v ? FontWeight.bold : FontWeight.normal)));
          model.updateTheme(updatedTheme);
        },
        onFontStyleChanged: (v) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(
                  body2: body2.copyWith(
                      fontStyle: v ? FontStyle.italic : FontStyle.normal)));
          model.updateTheme(updatedTheme);
        },
      ),
      _getTextThemeForm(
        'Headline',
        colorValue: headline.color,
        fontSize: headline.fontSize,
        isBold: headline.fontWeight == FontWeight.bold,
        isItalic: headline.fontStyle == FontStyle.italic,
        onColorChanged: (c) {
          final updatedTheme = theme.copyWith(
              textTheme:
                  txtTheme.copyWith(headline: headline.copyWith(color: c)));
          model.updateTheme(updatedTheme);
        },
        onSizeChanged: (s) {
          final updatedTheme = theme.copyWith(
              textTheme:
                  txtTheme.copyWith(headline: headline.copyWith(fontSize: s)));
          model.updateTheme(updatedTheme);
        },
        onWeightChanged: (v) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(
                  headline: headline.copyWith(
                      fontWeight: v ? FontWeight.bold : FontWeight.normal)));
          model.updateTheme(updatedTheme);
        },
        onFontStyleChanged: (v) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(
                  headline: headline.copyWith(
                      fontStyle: v ? FontStyle.italic : FontStyle.normal)));
          model.updateTheme(updatedTheme);
        },
      ),
      _getTextThemeForm(
        'Subhead',
        colorValue: subhead.color,
        fontSize: subhead.fontSize,
        isBold: subhead.fontWeight == FontWeight.bold,
        isItalic: subhead.fontStyle == FontStyle.italic,
        onColorChanged: (c) {
          final updatedTheme = theme.copyWith(
              textTheme:
                  txtTheme.copyWith(subhead: subhead.copyWith(color: c)));
          model.updateTheme(updatedTheme);
        },
        onSizeChanged: (s) {
          final updatedTheme = theme.copyWith(
              textTheme:
                  txtTheme.copyWith(subhead: subhead.copyWith(fontSize: s)));
          model.updateTheme(updatedTheme);
        },
        onWeightChanged: (v) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(
                  subhead: subhead.copyWith(
                      fontWeight: v ? FontWeight.bold : FontWeight.normal)));
          model.updateTheme(updatedTheme);
        },
        onFontStyleChanged: (v) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(
                  subhead: subhead.copyWith(
                      fontStyle: v ? FontStyle.italic : FontStyle.normal)));
          model.updateTheme(updatedTheme);
        },
      ),
      _getTextThemeForm(
        'Title',
        colorValue: title.color,
        fontSize: title.fontSize,
        isBold: title.fontWeight == FontWeight.bold,
        isItalic: title.fontStyle == FontStyle.italic,
        onColorChanged: (c) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(title: title.copyWith(color: c)));
          model.updateTheme(updatedTheme);
        },
        onSizeChanged: (s) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(title: title.copyWith(fontSize: s)));
          model.updateTheme(updatedTheme);
        },
        onWeightChanged: (v) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(
                  title: title.copyWith(
                      fontWeight: v ? FontWeight.bold : FontWeight.normal)));
          model.updateTheme(updatedTheme);
        },
        onFontStyleChanged: (v) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(
                  title: title.copyWith(
                      fontStyle: v ? FontStyle.italic : FontStyle.normal)));
          model.updateTheme(updatedTheme);
        },
      ),
      _getTextThemeForm(
        'Button',
        colorValue: button.color,
        fontSize: button.fontSize,
        isBold: button.fontWeight == FontWeight.bold,
        isItalic: button.fontStyle == FontStyle.italic,
        onColorChanged: (c) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(button: button.copyWith(color: c)));
          model.updateTheme(updatedTheme);
        },
        onSizeChanged: (s) {
          final updatedTheme = theme.copyWith(
              textTheme:
                  txtTheme.copyWith(button: button.copyWith(fontSize: s)));
          model.updateTheme(updatedTheme);
        },
        onWeightChanged: (v) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(
                  button: button.copyWith(
                      fontWeight: v ? FontWeight.bold : FontWeight.normal)));
          model.updateTheme(updatedTheme);
        },
        onFontStyleChanged: (v) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(
                  button: button.copyWith(
                      fontStyle: v ? FontStyle.italic : FontStyle.normal)));
          model.updateTheme(updatedTheme);
        },
      ),
      _getTextThemeForm(
        'Display 1',
        colorValue: display1.color,
        fontSize: display1.fontSize,
        isBold: display1.fontWeight == FontWeight.bold,
        isItalic: display1.fontStyle == FontStyle.italic,
        onColorChanged: (c) {
          final updatedTheme = theme.copyWith(
              textTheme:
                  txtTheme.copyWith(display1: display1.copyWith(color: c)));
          model.updateTheme(updatedTheme);
        },
        onSizeChanged: (s) {
          final updatedTheme = theme.copyWith(
              textTheme:
                  txtTheme.copyWith(display1: display1.copyWith(fontSize: s)));
          model.updateTheme(updatedTheme);
        },
        onWeightChanged: (v) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(
                  display1: display1.copyWith(
                      fontWeight: v ? FontWeight.bold : FontWeight.normal)));
          model.updateTheme(updatedTheme);
        },
        onFontStyleChanged: (v) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(
                  display1: display1.copyWith(
                      fontStyle: v ? FontStyle.italic : FontStyle.normal)));
          model.updateTheme(updatedTheme);
        },
      ),
      _getTextThemeForm(
        'Display 2',
        colorValue: display2.color,
        fontSize: display2.fontSize,
        isBold: display2.fontWeight == FontWeight.bold,
        isItalic: display2.fontStyle == FontStyle.italic,
        onColorChanged: (c) {
          final updatedTheme = theme.copyWith(
              textTheme:
                  txtTheme.copyWith(display2: display2.copyWith(color: c)));
          model.updateTheme(updatedTheme);
        },
        onSizeChanged: (s) {
          final updatedTheme = theme.copyWith(
              textTheme:
                  txtTheme.copyWith(display2: display2.copyWith(fontSize: s)));
          model.updateTheme(updatedTheme);
        },
        onWeightChanged: (v) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(
                  display2: display2.copyWith(
                      fontWeight: v ? FontWeight.bold : FontWeight.normal)));
          model.updateTheme(updatedTheme);
        },
        onFontStyleChanged: (v) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(
                  display2: display2.copyWith(
                      fontStyle: v ? FontStyle.italic : FontStyle.normal)));
          model.updateTheme(updatedTheme);
        },
      ),
      _getTextThemeForm(
        'Display 3',
        colorValue: display3.color,
        fontSize: display3.fontSize,
        isBold: display3.fontWeight == FontWeight.bold,
        isItalic: display3.fontStyle == FontStyle.italic,
        onColorChanged: (c) {
          final updatedTheme = theme.copyWith(
              textTheme:
                  txtTheme.copyWith(display3: display3.copyWith(color: c)));
          model.updateTheme(updatedTheme);
        },
        onSizeChanged: (s) {
          final updatedTheme = theme.copyWith(
              textTheme:
                  txtTheme.copyWith(display3: display3.copyWith(fontSize: s)));
          model.updateTheme(updatedTheme);
        },
        onWeightChanged: (v) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(
                  display3: display3.copyWith(
                      fontWeight: v ? FontWeight.bold : FontWeight.normal)));
          model.updateTheme(updatedTheme);
        },
        onFontStyleChanged: (v) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(
                  display3: display3.copyWith(
                      fontStyle: v ? FontStyle.italic : FontStyle.normal)));
          model.updateTheme(updatedTheme);
        },
      ),
      _getTextThemeForm(
        'Display 4',
        colorValue: display4.color,
        fontSize: display4.fontSize,
        isBold: display4.fontWeight == FontWeight.bold,
        isItalic: display4.fontStyle == FontStyle.italic,
        onColorChanged: (c) {
          final updatedTheme = theme.copyWith(
              textTheme:
                  txtTheme.copyWith(display4: display4.copyWith(color: c)));
          model.updateTheme(updatedTheme);
        },
        onSizeChanged: (s) {
          final updatedTheme = theme.copyWith(
              textTheme:
                  txtTheme.copyWith(display4: display4.copyWith(fontSize: s)));
          model.updateTheme(updatedTheme);
        },
        onWeightChanged: (v) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(
                  display4: display4.copyWith(
                      fontWeight: v ? FontWeight.bold : FontWeight.normal)));
          model.updateTheme(updatedTheme);
        },
        onFontStyleChanged: (v) {
          final updatedTheme = theme.copyWith(
              textTheme: txtTheme.copyWith(
                  display4: display4.copyWith(
                      fontStyle: v ? FontStyle.italic : FontStyle.normal)));
          model.updateTheme(updatedTheme);
        },
      ),
    ];
  }

  Widget _getTextThemeForm(
    String label, {
    @required ValueChanged<Color> onColorChanged,
    @required ValueChanged<double> onSizeChanged,
    @required ValueChanged<bool> onWeightChanged,
    @required ValueChanged<bool> onFontStyleChanged,
    @required Color colorValue,
    @required double fontSize,
    @required bool isBold,
    @required bool isItalic,
  }) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: FractionalOffset.centerLeft,
            child: Text(
              label,
              style: h3,
              textAlign: TextAlign.left,
            ),
          ),
          _getFieldRow(
            ColorSelector('Color', colorValue, onColorChanged),
            FontSizeSelector(fontSize, onSizeChanged, min: 8.0),
          ),
          _getFieldRow(
            Row(
              children: [
                Text('FontWeight : Normal '),
                Switch(value: isBold, onChanged: onWeightChanged),
                Text(' Bold'),
              ],
            ),
            Row(
              children: [
                Text('FontStyle: Normal '),
                Switch(value: isItalic, onChanged: onFontStyleChanged),
                Text(' Italic'),
              ],
            ),
          ),
        ],
      );

  Widget _getFieldRow(w1, w2) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [Expanded(child: w1), Expanded(child: w2)],
      );
}
