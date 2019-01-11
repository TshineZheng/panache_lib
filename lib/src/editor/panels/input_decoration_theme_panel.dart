import 'package:flutter/material.dart';

import '../../theme_model.dart';
import '../../utils/constants.dart';
import '../controls/color_selector.dart';
import '../controls/inputs_border_control.dart';
import '../controls/slider_control.dart';
import '../controls/switcher_control.dart';
import '../controls/text_style_control.dart';
import '../editor_utils.dart';

class InputDecorationThemePanel extends StatelessWidget {
  final ThemeModel model;

  InputDecorationTheme get inputTheme => model.theme.inputDecorationTheme;

  InputDecorationThemePanel(this.model);

  /*Color get selectedColor =>
      model.theme.tabBarTheme.labelColor ??
      model.theme.primaryTextTheme.body2.color;*/

  @override
  Widget build(BuildContext context) {
    final baseStyle =
        model.theme.textTheme.caption.copyWith(color: model.theme.hintColor);
    final helperStyle = inputTheme.helperStyle ?? baseStyle;
    final labelStyle = inputTheme.labelStyle ?? baseStyle;
    final hintStyle = inputTheme.hintStyle ?? baseStyle;
    final errorStyle = inputTheme.errorStyle ??
        baseStyle.copyWith(color: model.theme.errorColor);
    final counterStyle = inputTheme.counterStyle ?? baseStyle;
    final prefixStyle = inputTheme.prefixStyle ?? baseStyle;
    final suffixStyle = inputTheme.suffixStyle ?? baseStyle;

    return Container(
      padding: kPadding,
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getFieldsRow([
            SwitcherControl(
              label: 'Filled',
              checked: inputTheme.filled,
              onChange: (filled) => _updateInputDecorationTheme(
                  _copyInputDecorationThemeWith(inputTheme, filled: filled)),
            ),
            ColorSelector(
              'Fill color',
              inputTheme.fillColor ?? Colors.white.withAlpha(0),
              (color) => _updateInputDecorationTheme(
                  _copyInputDecorationThemeWith(inputTheme,
                      fillColor: color, filled: true)),
              padding: 0,
            ),
          ]),
          getFieldsRow([
            InputBorderControl(
              label: 'Border',
              axis: Axis.vertical,
              border: inputTheme.border,
              onShapeChanged: (InputBorder value) {
                _updateInputDecorationTheme(
                    _copyInputDecorationThemeWith(inputTheme, border: value));
              },
            ),
            InputBorderControl(
              label: 'Error border',
              axis: Axis.vertical,
              border: inputTheme.errorBorder,
              onShapeChanged: (InputBorder value) {
                _updateInputDecorationTheme(_copyInputDecorationThemeWith(
                    inputTheme,
                    errorBorder: value));
              },
            )
          ]),
          getFieldsRow([
            InputBorderControl(
              label: 'Enabled border',
              axis: Axis.vertical,
              border: inputTheme.enabledBorder,
              onShapeChanged: (InputBorder value) {
                _updateInputDecorationTheme(_copyInputDecorationThemeWith(
                    inputTheme,
                    enabledBorder: value));
              },
            ),
            InputBorderControl(
              label: 'Disabled border',
              axis: Axis.vertical,
              border: inputTheme.disabledBorder,
              onShapeChanged: (InputBorder value) {
                _updateInputDecorationTheme(_copyInputDecorationThemeWith(
                    inputTheme,
                    disabledBorder: value));
              },
            ),
          ]),
          getFieldsRow([
            InputBorderControl(
              label: 'Focused border',
              axis: Axis.vertical,
              border: inputTheme.focusedBorder,
              onShapeChanged: (InputBorder value) {
                _updateInputDecorationTheme(_copyInputDecorationThemeWith(
                    inputTheme,
                    focusedBorder: value));
              },
            ),
            InputBorderControl(
              label: 'Focused error border',
              axis: Axis.vertical,
              border: inputTheme.focusedErrorBorder,
              onShapeChanged: (InputBorder value) {
                _updateInputDecorationTheme(_copyInputDecorationThemeWith(
                    inputTheme,
                    focusedErrorBorder: value));
              },
            ),
          ]),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: getFieldsRow([
              SwitcherControl(
                label: 'Is dense',
                checked: inputTheme.isDense,
                onChange: (value) => _updateInputDecorationTheme(
                    _copyInputDecorationThemeWith(inputTheme, isDense: value)),
              ),
              SwitcherControl(
                  label: 'Is collapsed',
                  checked: inputTheme.isCollapsed,
                  onChange: (value) =>
                      _updateInputDecorationTheme(_copyInputDecorationThemeWith(
                        inputTheme,
                        isCollapsed: value,
                      ))),
            ]),
          ),
          SwitcherControl(
              label: 'Has floating label',
              checked: inputTheme.hasFloatingPlaceholder,
              onChange: (value) =>
                  _updateInputDecorationTheme(_copyInputDecorationThemeWith(
                    inputTheme,
                    hasFloatingPlaceholder: value,
                  ))),
          Divider(),
          TextStyleControl(
            'Label style',
            maxFontSize: 32,
            style: labelStyle,
            onSizeChanged: (double value) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    labelStyle: labelStyle.copyWith(fontSize: value))),
            onColorChanged: (Color value) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    labelStyle: labelStyle.copyWith(color: value))),
            onWeightChanged: (isBold) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    labelStyle: labelStyle.copyWith(
                        fontWeight:
                            isBold ? FontWeight.bold : FontWeight.normal))),
            onFontStyleChanged: (isItalic) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    labelStyle: labelStyle.copyWith(
                        fontStyle:
                            isItalic ? FontStyle.italic : FontStyle.normal))),
          ),
          Divider(),
          TextStyleControl(
            'Hint style',
            maxFontSize: 32,
            style: hintStyle,
            onSizeChanged: (double value) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    hintStyle: hintStyle.copyWith(fontSize: value))),
            onColorChanged: (Color value) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    hintStyle: hintStyle.copyWith(color: value))),
            onWeightChanged: (isBold) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    hintStyle: hintStyle.copyWith(
                        fontWeight:
                            isBold ? FontWeight.bold : FontWeight.normal))),
            onFontStyleChanged: (isItalic) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    hintStyle: hintStyle.copyWith(
                        fontStyle:
                            isItalic ? FontStyle.italic : FontStyle.normal))),
          ),
          Divider(),
          TextStyleControl(
            'Helper style',
            maxFontSize: 24,
            style: helperStyle,
            onSizeChanged: (double value) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    helperStyle: helperStyle.copyWith(fontSize: value))),
            onColorChanged: (Color value) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    helperStyle: helperStyle.copyWith(color: value))),
            onWeightChanged: (isBold) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    helperStyle: helperStyle.copyWith(
                        fontWeight:
                            isBold ? FontWeight.bold : FontWeight.normal))),
            onFontStyleChanged: (isItalic) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    helperStyle: helperStyle.copyWith(
                        fontStyle:
                            isItalic ? FontStyle.italic : FontStyle.normal))),
          ),
          Divider(),
          TextStyleControl(
            'Error style',
            maxFontSize: 24,
            style: errorStyle,
            onSizeChanged: (double value) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    errorStyle: errorStyle.copyWith(fontSize: value))),
            onColorChanged: (Color value) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    errorStyle: errorStyle.copyWith(color: value))),
            onWeightChanged: (isBold) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    errorStyle: errorStyle.copyWith(
                        fontWeight:
                            isBold ? FontWeight.bold : FontWeight.normal))),
            onFontStyleChanged: (isItalic) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    errorStyle: errorStyle.copyWith(
                        fontStyle:
                            isItalic ? FontStyle.italic : FontStyle.normal))),
          ),
          Divider(),
          TextStyleControl(
            'Prefix style',
            maxFontSize: 24,
            style: prefixStyle,
            onSizeChanged: (double value) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    prefixStyle: prefixStyle.copyWith(fontSize: value))),
            onColorChanged: (Color value) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    prefixStyle: prefixStyle.copyWith(color: value))),
            onWeightChanged: (isBold) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    prefixStyle: prefixStyle.copyWith(
                        fontWeight:
                            isBold ? FontWeight.bold : FontWeight.normal))),
            onFontStyleChanged: (isItalic) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    prefixStyle: prefixStyle.copyWith(
                        fontStyle:
                            isItalic ? FontStyle.italic : FontStyle.normal))),
          ),
          Divider(),
          TextStyleControl(
            'Suffix style',
            maxFontSize: 24,
            style: suffixStyle,
            onSizeChanged: (double value) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    suffixStyle: suffixStyle.copyWith(fontSize: value))),
            onColorChanged: (Color value) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    suffixStyle: suffixStyle.copyWith(color: value))),
            onWeightChanged: (isBold) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    suffixStyle: suffixStyle.copyWith(
                        fontWeight:
                            isBold ? FontWeight.bold : FontWeight.normal))),
            onFontStyleChanged: (isItalic) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    suffixStyle: suffixStyle.copyWith(
                        fontStyle:
                            isItalic ? FontStyle.italic : FontStyle.normal))),
          ),
          Divider(),
          TextStyleControl(
            'Counter style',
            maxFontSize: 24,
            style: counterStyle,
            onSizeChanged: (double value) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    counterStyle: counterStyle.copyWith(fontSize: value))),
            onColorChanged: (Color value) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    counterStyle: counterStyle.copyWith(color: value))),
            onWeightChanged: (isBold) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    counterStyle: counterStyle.copyWith(
                        fontWeight:
                            isBold ? FontWeight.bold : FontWeight.normal))),
            onFontStyleChanged: (isItalic) => _updateInputDecorationTheme(
                _copyInputDecorationThemeWith(inputTheme,
                    counterStyle: counterStyle.copyWith(
                        fontStyle:
                            isItalic ? FontStyle.italic : FontStyle.normal))),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Container(
              color: Colors.white70,
              padding: const EdgeInsets.all(6.0),
              child: SliderPropertyControl(
                inputTheme.contentPadding?.vertical ?? 0,
                (double newValue) => _updateInputDecorationTheme(
                    _copyInputDecorationThemeWith(inputTheme,
                        contentPadding: EdgeInsets.all(newValue))),
                label: 'Content Padding',
                max: 48,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updateInputDecorationTheme(InputDecorationTheme inputTheme) =>
      model.updateTheme(model.theme.copyWith(inputDecorationTheme: inputTheme));
}

InputDecorationTheme _copyInputDecorationThemeWith(
  InputDecorationTheme theme, {
  InputBorder border,
  EdgeInsetsGeometry contentPadding,
  TextStyle counterStyle,
  InputBorder disabledBorder,
  InputBorder enabledBorder,
  InputBorder errorBorder,
  int errorMaxLines,
  TextStyle errorStyle,
  Color fillColor,
  bool filled,
  InputBorder focusedBorder,
  InputBorder focusedErrorBorder,
  bool hasFloatingPlaceholder,
  TextStyle helperStyle,
  TextStyle hintStyle,
  bool isCollapsed,
  bool isDense,
  TextStyle labelStyle,
  TextStyle prefixStyle,
  TextStyle suffixStyle,
}) {
  return InputDecorationTheme(
    border: border ?? theme.border,
    contentPadding: contentPadding ?? theme.contentPadding,
    counterStyle: counterStyle ?? theme.counterStyle,
    disabledBorder: disabledBorder ?? theme.disabledBorder,
    enabledBorder: enabledBorder ?? theme.enabledBorder,
    errorBorder: errorBorder ?? theme.errorBorder,
    errorMaxLines: errorMaxLines ?? theme.errorMaxLines,
    errorStyle: errorStyle ?? theme.errorStyle,
    fillColor: fillColor ?? theme.fillColor,
    filled: filled ?? theme.filled,
    focusedBorder: focusedBorder ?? theme.focusedBorder,
    focusedErrorBorder: focusedErrorBorder ?? theme.focusedErrorBorder,
    hasFloatingPlaceholder:
        hasFloatingPlaceholder ?? theme.hasFloatingPlaceholder,
    helperStyle: helperStyle ?? theme.helperStyle,
    hintStyle: hintStyle ?? theme.hintStyle,
    isCollapsed: isCollapsed ?? theme.isCollapsed,
    isDense: isDense ?? theme.isDense,
    labelStyle: labelStyle ?? theme.labelStyle,
    prefixStyle: prefixStyle ?? theme.prefixStyle,
    suffixStyle: suffixStyle ?? theme.suffixStyle,
  );
}
