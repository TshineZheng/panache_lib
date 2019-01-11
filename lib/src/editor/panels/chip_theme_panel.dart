import 'package:flutter/material.dart';

import '../../theme_model.dart';
import '../../utils/constants.dart';
import '../controls/brightness_control.dart';
import '../controls/color_selector.dart';
import '../controls/shape_form_control.dart';
import '../controls/text_style_control.dart';
import '../editor_utils.dart';

class ChipThemePanel extends StatelessWidget {
  final ThemeModel model;

  ChipThemeData get chipTheme => model.theme.chipTheme;

  ChipThemePanel(this.model);

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).textTheme;
    final labelStyle = appTextTheme.subtitle;
    final chipLabelStyle = chipTheme.labelStyle;
    final chipSecondaryLabelStyle = chipTheme.secondaryLabelStyle;

    return Container(
      padding: kPadding,
      color: Colors.grey.shade100,
      child: Column(
        children: <Widget>[
          ColorSelector(
            'Background color',
            model.theme.chipTheme.backgroundColor,
            (color) =>
                _updateChipTheme(chipTheme.copyWith(backgroundColor: color)),
            padding: 2,
            maxLabelWidth: 250,
          ),
          getFieldsRow([
            ColorSelector(
              'Secondary selected color',
              model.theme.chipTheme.secondarySelectedColor,
              (color) => _updateChipTheme(
                  chipTheme.copyWith(secondarySelectedColor: color)),
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
              (color) =>
                  _updateChipTheme(chipTheme.copyWith(disabledColor: color)),
              padding: 2,
            ),
            ColorSelector(
              'Delete icon color',
              model.theme.chipTheme.deleteIconColor,
              (color) =>
                  _updateChipTheme(chipTheme.copyWith(deleteIconColor: color)),
              padding: 2,
            ),
          ]),
          Divider(),
          TextStyleControl(
            'Label Style',
            key: Key('chip_textstyle'),
            style: chipLabelStyle,
            onColorChanged: (color) => _updateChipTheme(chipTheme.copyWith(
                labelStyle: chipTheme.labelStyle.copyWith(color: color))),
            onSizeChanged: (size) => chipTheme.copyWith(
                labelStyle: chipTheme.labelStyle.copyWith(fontSize: size)),
            onWeightChanged: (isBold) => _updateChipTheme(chipTheme.copyWith(
                labelStyle: chipTheme.labelStyle.copyWith(
                    fontWeight: isBold ? FontWeight.bold : FontWeight.normal))),
            onFontStyleChanged: (isItalic) => _updateChipTheme(
                  chipTheme.copyWith(
                      labelStyle: chipTheme.labelStyle.copyWith(
                          fontStyle:
                              isItalic ? FontStyle.italic : FontStyle.normal)),
                ),
            maxFontSize: 32,
          ),
          Divider(),
          TextStyleControl(
            'Secondary Label Style',
            key: Key('chip_alternative_textstyle'),
            style: chipSecondaryLabelStyle,
            onColorChanged: (color) => _updateChipTheme(
                  chipTheme.copyWith(
                      secondaryLabelStyle:
                          chipTheme.secondaryLabelStyle.copyWith(color: color)),
                ),
            onSizeChanged: (size) => _updateChipTheme(
                  chipTheme.copyWith(
                      secondaryLabelStyle: chipTheme.secondaryLabelStyle
                          .copyWith(fontSize: size)),
                ),
            onWeightChanged: (isBold) => _updateChipTheme(chipTheme.copyWith(
                secondaryLabelStyle: chipTheme.secondaryLabelStyle.copyWith(
                    fontWeight: isBold ? FontWeight.bold : FontWeight.normal))),
            onFontStyleChanged: (isItalic) => chipTheme.copyWith(
                secondaryLabelStyle: chipTheme.secondaryLabelStyle.copyWith(
                    fontStyle: isItalic ? FontStyle.italic : FontStyle.normal)),
            maxFontSize: 32,
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ShapeFormControl(
                  onShapeChanged: (shapeBorder) =>
                      _updateChipTheme(chipTheme.copyWith(shape: shapeBorder)),
                  shape: chipTheme.shape,
                  labelStyle: labelStyle),
              Expanded(
                child: BrightnessSelector(
                  label: 'Brightness',
                  isDark: chipTheme.brightness == Brightness.dark,
                  onBrightnessChanged: (value) => _onBrightnessChanged(value,
                      labelStyle: appTextTheme.body1),
                ),
              )
            ],
          ),
        ],
      ),
    );
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

  _updateChipTheme(ChipThemeData chipTheme) {
    final updatedTheme = model.theme.copyWith(chipTheme: chipTheme);
    model.updateTheme(updatedTheme);
  }
}
