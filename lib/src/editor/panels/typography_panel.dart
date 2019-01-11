import 'package:flutter/material.dart';

import '../../theme_model.dart';
import '../../utils/constants.dart';
import '../controls/text_style_control.dart';

class TypographyThemePanel extends StatelessWidget {
  final TextTheme txtTheme;
  final String themeRef;
  final ThemeModel model;

  const TypographyThemePanel({
    Key key,
    @required this.txtTheme,
    @required this.themeRef,
    @required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.grey.shade200,
        padding: kPadding,
        child: Column(
          children: _buildTextThemeEditorFields(model),
        ),
      );

  List<Widget> _buildTextThemeEditorFields(ThemeModel model) {
    final headline = txtTheme.headline;
    final title = txtTheme.title;
    final subhead = txtTheme.subhead;
    final subtitle = txtTheme.subtitle;
    final body1 = txtTheme.body1;
    final body2 = txtTheme.body2;
    final caption = txtTheme.caption;
    final overline = txtTheme.overline;
    final button = txtTheme.button;
    final display1 = txtTheme.display1;
    final display2 = txtTheme.display2;
    final display3 = txtTheme.display3;
    final display4 = txtTheme.display4;

    final styleNames = [
      TextStyleControlData(styleName: 'headline', style: headline),
      TextStyleControlData(styleName: 'title', style: title),
      TextStyleControlData(styleName: 'subhead', style: subhead),
      TextStyleControlData(styleName: 'subtitle', style: subtitle),
      TextStyleControlData(styleName: 'body1', style: body1),
      TextStyleControlData(styleName: 'body2', style: body2),
      TextStyleControlData(styleName: 'caption', style: caption),
      TextStyleControlData(styleName: 'overline', style: overline),
      TextStyleControlData(styleName: 'button', style: button),
      TextStyleControlData(styleName: 'display1', style: display1),
      TextStyleControlData(styleName: 'display2', style: display2),
      TextStyleControlData(styleName: 'display3', style: display3),
      TextStyleControlData(styleName: 'display4', style: display4),
    ];

    return styleNames.map((data) {
      return TextStyleControl(
        data.styleName,
        style: data.style,
        onColorChanged: (c) => onColorChanged(
            style: data.style, color: c, styleName: data.styleName),
        onSizeChanged: (s) => onSizeChanged(
            style: data.style, size: s, styleName: data.styleName),
        onWeightChanged: (isBold) => onWeightChanged(
            style: data.style, isBold: isBold, styleName: data.styleName),
        onFontStyleChanged: (fontStyle) => onFontStyleChanged(
            style: data.style, isItalic: fontStyle, styleName: data.styleName),
        onLetterSpacingChanged: (double spacing) => onLetterSpacingChanged(
            style: data.style, spacing: spacing, styleName: data.styleName),
        onWordSpacingChanged: (double spacing) => onWordSpacingChanged(
            style: data.style, spacing: spacing, styleName: data.styleName),
        onLineHeightChanged: (double lineHeight) => onLineHeightChanged(
            style: data.style, height: lineHeight, styleName: data.styleName),
        onDecorationChanged: (TextDecoration decoration) => onDecorationChanged(
            style: data.style,
            decoration: decoration,
            styleName: data.styleName),
        onDecorationStyleChanged: (TextDecorationStyle decorationStyle) =>
            onDecorationStyleChanged(
                style: data.style,
                decorationStyle: decorationStyle,
                styleName: data.styleName),
        onDecorationColorChanged: (Color color) => onDecorationColorChanged(
            style: data.style,
            decorationColor: color,
            styleName: data.styleName),
      );
    }).toList();
  }

  void apply(TextStyle style, String styleName) {
    final styleArgs = <Symbol, dynamic>{};
    styleArgs[Symbol(styleName)] = style;

    final args = <Symbol, dynamic>{};
    args[Symbol(themeRef)] = Function.apply(txtTheme.copyWith, null, styleArgs);
    model.updateTheme(Function.apply(model.theme.copyWith, null, args));
  }

  void onColorChanged({TextStyle style, Color color, String styleName}) =>
      apply(style.copyWith(color: color), styleName);

  void onSizeChanged({TextStyle style, double size, String styleName}) =>
      apply(style.copyWith(fontSize: size), styleName);

  void onWeightChanged({TextStyle style, bool isBold, String styleName}) =>
      apply(
        style.copyWith(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
        styleName,
      );

  void onFontStyleChanged({TextStyle style, bool isItalic, String styleName}) =>
      apply(
        style.copyWith(
            fontStyle: isItalic ? FontStyle.italic : FontStyle.normal),
        styleName,
      );

  void onLetterSpacingChanged(
          {TextStyle style, double spacing, String styleName}) =>
      apply(style.copyWith(letterSpacing: spacing), styleName);

  void onWordSpacingChanged(
          {TextStyle style, double spacing, String styleName}) =>
      apply(style.copyWith(wordSpacing: spacing), styleName);

  void onLineHeightChanged(
          {TextStyle style, double height, String styleName}) =>
      apply(style.copyWith(height: height), styleName);

  void onDecorationChanged(
          {TextStyle style, TextDecoration decoration, String styleName}) =>
      apply(style.copyWith(decoration: decoration), styleName);

  void onDecorationStyleChanged(
          {TextStyle style,
          TextDecorationStyle decorationStyle,
          String styleName}) =>
      apply(style.copyWith(decorationStyle: decorationStyle), styleName);

  void onDecorationColorChanged(
          {TextStyle style, Color decorationColor, String styleName}) =>
      apply(style.copyWith(decorationColor: decorationColor), styleName);
}

class TextStyleControlData {
  final TextStyle style;
  final String styleName;

  TextStyleControlData({this.style, this.styleName});
}
