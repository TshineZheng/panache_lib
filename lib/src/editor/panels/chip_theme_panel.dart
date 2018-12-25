import 'package:flutter/material.dart';
import 'package:flutterial_components/src/editor/controls/color_selector.dart';
import 'package:flutterial_components/src/editor/controls/shape_form_control.dart';
import 'package:flutterial_components/src/editor/controls/text_style_control.dart';
import 'package:flutterial_components/src/editor/editor_utils.dart';
import 'package:flutterial_components/src/theme_model.dart';
import 'package:flutterial_components/src/utils/constants.dart';

import '../controls/brightness_control.dart';

class ChipThemePanel extends StatelessWidget {
  final ThemeModel model;

  ChipThemeData get chipTheme => model.theme.chipTheme;

  ChipThemePanel(this.model);

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).textTheme;
    final labelStyle = appTextTheme.subtitle;
    final chipLabelStyle = chipTheme.labelStyle;

    return Container(
      padding: kPadding,
      color: Colors.grey.shade100,
      child: Column(
        children: <Widget>[
          getFieldsRow([
            ColorSelector(
              'Background color',
              model.theme.chipTheme.backgroundColor,
              (color) => _onBackgroundColorChanged(color),
              padding: 2,
            ),
            ColorSelector(
              'Selected color',
              model.theme.chipTheme.selectedColor,
              (color) =>
                  _updateChipTheme(chipTheme.copyWith(selectedColor: color)),
              padding: 2,
            ),
          ]),
          getFieldsRow([
            ColorSelector(
              'Disabled color',
              model.theme.chipTheme.disabledColor,
              (color) => _onDisabledColorChanged(color),
              padding: 2,
            ),
            ColorSelector(
              'Delete icon color',
              model.theme.chipTheme.deleteIconColor,
              (color) => _onDeleteIconColorChanged(color),
              padding: 2,
            ),
          ]),
          Divider(),
          TextStyleControl(
            'Label Style',
            color: chipLabelStyle.color,
            fontSize: chipLabelStyle.fontSize ?? 24,
            isBold: chipLabelStyle.fontWeight == FontWeight.bold,
            isItalic: chipLabelStyle.fontStyle == FontStyle.italic,
            onColorChanged: _onLabelStyleColorChanged,
            onSizeChanged: _onLabelStyleSizeChanged,
            onWeightChanged: _onLabelStyleWeightChanged,
            onFontStyleChanged: _onLabelStyleItalicChanged,
            maxFontSize: 32,
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              ShapeFormControl(
                  onShapeChanged: _onShapeChanged,
                  shape: chipTheme.shape,
                  labelStyle: labelStyle),
              BrightnessSelector(
                label: 'Brightness',
                isDark: chipTheme.brightness == Brightness.dark,
                onBrightnessChanged: (value) =>
                    _onBrightnessChanged(value, labelStyle: appTextTheme.body1),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _onLabelStyleItalicChanged(bool value) {
    final updatedTheme = model.theme.copyWith(
        chipTheme: chipTheme.copyWith(
            labelStyle: chipTheme.labelStyle.copyWith(
                fontStyle: value ? FontStyle.italic : FontStyle.normal)));
    model.updateTheme(updatedTheme);
  }

  void _onLabelStyleWeightChanged(bool value) {
    final updatedTheme = model.theme.copyWith(
        chipTheme: chipTheme.copyWith(
            labelStyle: chipTheme.labelStyle.copyWith(
                fontWeight: value ? FontWeight.bold : FontWeight.normal)));
    model.updateTheme(updatedTheme);
  }

  void _onLabelStyleSizeChanged(double value) {
    final updatedTheme = model.theme.copyWith(
        chipTheme: chipTheme.copyWith(
            labelStyle: chipTheme.labelStyle.copyWith(fontSize: value)));
    model.updateTheme(updatedTheme);
  }

  void _onLabelStyleColorChanged(Color value) {
    final updatedTheme = model.theme.copyWith(
        chipTheme: chipTheme.copyWith(
            labelStyle: chipTheme.labelStyle.copyWith(color: value)));
    model.updateTheme(updatedTheme);
  }

  void _onShapeChanged(ShapeBorder value) {
    final updatedTheme =
        model.theme.copyWith(chipTheme: chipTheme.copyWith(shape: value));
    model.updateTheme(updatedTheme);
  }

  void _onBrightnessChanged(Brightness value, {TextStyle labelStyle}) {
    final updatedTheme = model.theme.copyWith(
        chipTheme: ChipThemeData.fromDefaults(
      brightness: value,
      /*primaryColor: model.theme.primaryColor,*/
      secondaryColor: model.theme.primaryColor,
      labelStyle: labelStyle,
    ));
    model.updateTheme(updatedTheme);
  }

  void _onBackgroundColorChanged(Color value) {
    final updatedTheme = model.theme
        .copyWith(chipTheme: chipTheme.copyWith(backgroundColor: value));
    model.updateTheme(updatedTheme);
  }

  void _onDisabledColorChanged(Color value) {
    final updatedTheme = model.theme
        .copyWith(chipTheme: chipTheme.copyWith(disabledColor: value));
    model.updateTheme(updatedTheme);
  }

  void _onDeleteIconColorChanged(Color value) {
    final updatedTheme = model.theme
        .copyWith(chipTheme: chipTheme.copyWith(deleteIconColor: value));
    model.updateTheme(updatedTheme);
  }

  _updateChipTheme(ChipThemeData chipTheme) {
    final updatedTheme = model.theme.copyWith(chipTheme: chipTheme);
    model.updateTheme(updatedTheme);
  }
}
