import 'package:flutter/material.dart';
import 'package:flutterial_components/src/editor/controls/shape_form_control.dart';
import 'package:flutterial_components/src/editor/controls/slider_control.dart';
import 'package:flutterial_components/src/theme_model.dart';

import '../../constants.dart';
import '../controls/button_color_scheme_editor.dart';
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
                    onShapeChanged: _onShapeChanged,
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
                  _onHorizontalPaddingChanged,
                  label: 'Horizontal padding',
                  max: 64,
                ),
                Text(
                  'Align dropdown',
                  style: labelStyle,
                ),
                Switch.adaptive(
                    value: buttonTheme.alignedDropdown,
                    onChanged: _onAlignDropdownChanged)
              ],
            ),
          ),
          _buildButtonSizeControl(buttonTheme),
          ColorSchemeControl(
            scheme: buttonTheme.colorScheme,
            onSchemeChanged: _onSchemeChanged,
          )
        ],
      ),
    );
  }

  void _onShapeChanged(ShapeBorder value) {
    final updatedTheme =
        model.theme.copyWith(buttonTheme: buttonTheme.copyWith(shape: value));
    model.updateTheme(updatedTheme);
  }

  void _onSchemeChanged(ColorScheme value) {
    final updatedTheme = model.theme
        .copyWith(buttonTheme: buttonTheme.copyWith(colorScheme: value));
    model.updateTheme(updatedTheme);
  }

  Widget _buildButtonSizeControl(ButtonThemeData theme) {
    final minWidth = theme.minWidth;
    final height = theme.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 2.0),
      child: getFieldsRow([
        SliderPropertyControl(minWidth, _onMinWidthChanged,
            label: 'Min width', min: 48, max: 256),
        SliderPropertyControl(height, _onHeightChanged,
            label: 'Height', min: 24, max: 128),
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
            onChanged: (newButtonTextTheme) =>
                _onButtonTextThemeChanged(newButtonTextTheme)),
      ],
    );
  }

  _onButtonTextThemeChanged(textTheme) =>
      model.updateTheme(model.theme.copyWith(
        buttonTheme: buttonTheme.copyWith(textTheme: textTheme),
      ));

  DropdownMenuItem<ButtonTextTheme> _buildButtonTextThemeSelectorItem(
          ButtonTextTheme buttonTextTheme) =>
      DropdownMenuItem<ButtonTextTheme>(
        child: Text('$buttonTextTheme'.split('.').last),
        value: buttonTextTheme,
      );

  void _onMinWidthChanged(double value) {
    model.updateTheme(model.theme.copyWith(
      buttonTheme: buttonTheme.copyWith(minWidth: value),
    ));
  }

  void _onHeightChanged(double value) {
    model.updateTheme(model.theme.copyWith(
      buttonTheme: buttonTheme.copyWith(height: value),
    ));
  }

  void _onHorizontalPaddingChanged(double value) {
    model.updateTheme(model.theme.copyWith(
      buttonTheme: buttonTheme.copyWith(
          padding: EdgeInsets.symmetric(horizontal: value)),
    ));
  }

  void _onAlignDropdownChanged(bool value) {
    model.updateTheme(model.theme.copyWith(
      buttonTheme: buttonTheme.copyWith(alignedDropdown: value),
    ));
  }
}
