import 'package:flutter/material.dart';

import '../../theme_model.dart';
import '../../utils/constants.dart';
import '../controls/color_scheme_control.dart';
import '../controls/shape_form_control.dart';
import '../controls/slider_control.dart';
import '../editor_utils.dart';

class ButtonThemePanel extends StatelessWidget {
  final ThemeModel model;

  ButtonThemeData get buttonTheme => model.theme.buttonTheme;

  ButtonThemePanel(this.model);

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).textTheme;
    final labelStyle = appTextTheme.subtitle;
    final dropdownTextStyle = appTextTheme.body2;

    return Container(
      padding: kPadding,
      color: Colors.grey.shade200,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildButtonTextThemeSelector(buttonTheme.textTheme,
                      labelStyle: labelStyle,
                      dropdownTextStyle: dropdownTextStyle),
                  ShapeFormControl(
                    onShapeChanged: (shape) => _onButtonThemeChanged(
                        buttonTheme.copyWith(shape: shape)),
                    shape: buttonTheme.shape,
                    labelStyle: labelStyle,
                  )
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
              children: <Widget>[
                SliderPropertyControl(
                  buttonTheme.padding.horizontal,
                  (padding) => _onButtonThemeChanged(buttonTheme.copyWith(
                      padding: EdgeInsets.symmetric(horizontal: padding))),
                  label: 'Horizontal padding',
                  max: 64,
                ),
                Text(
                  'Align dropdown',
                  style: labelStyle,
                ),
                Switch.adaptive(
                    value: buttonTheme.alignedDropdown,
                    onChanged: (aligned) => _onButtonThemeChanged(
                        buttonTheme.copyWith(alignedDropdown: aligned)))
              ],
            ),
          ),
          _buildButtonSizeControl(buttonTheme),
          ColorSchemeControl(
            scheme: buttonTheme.colorScheme,
            onSchemeChanged: (scheme) => _onButtonThemeChanged(
                buttonTheme.copyWith(colorScheme: scheme)),
          )
        ],
      ),
    );
  }

  Widget _buildButtonSizeControl(ButtonThemeData theme) {
    final minWidth = theme.minWidth;
    final height = theme.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 2.0),
      child: getFieldsRow([
        SliderPropertyControl(
            minWidth,
            (width) =>
                _onButtonThemeChanged(buttonTheme.copyWith(minWidth: width)),
            label: 'Min width',
            min: 48,
            max: 256),
        SliderPropertyControl(
            height,
            (height) =>
                _onButtonThemeChanged(buttonTheme.copyWith(height: height)),
            label: 'Height',
            min: 24,
            max: 128),
      ]),
    );
  }

  Widget _buildButtonTextThemeSelector(ButtonTextTheme buttonTextTheme,
      {TextStyle labelStyle, TextStyle dropdownTextStyle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Text(
            'Text Theme',
            style: labelStyle,
          ),
        ),
        DropdownButton(
            style: dropdownTextStyle,
            value: buttonTextTheme,
            items: ButtonTextTheme.values
                .map(_buildButtonTextThemeSelectorItem)
                .toList(growable: false),
            onChanged: (newButtonTextTheme) => _onButtonThemeChanged(
                buttonTheme.copyWith(textTheme: newButtonTextTheme))),
      ],
    );
  }

  DropdownMenuItem<ButtonTextTheme> _buildButtonTextThemeSelectorItem(
          ButtonTextTheme buttonTextTheme) =>
      DropdownMenuItem<ButtonTextTheme>(
        child: Text('$buttonTextTheme'.split('.').last),
        value: buttonTextTheme,
      );

  void _onButtonThemeChanged(ButtonThemeData value) {
    model.updateTheme(
      model.theme.copyWith(buttonTheme: value),
    );
  }
}
