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
  Widget build(BuildContext context) {
    //final model = ThemeModel.of(context);
    return Container(
      color: Colors.grey.shade200,
      padding: kPadding,
      child: Column(
        children: _buildTextThemeEditorFields(model),
      ),
    );
  }

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
      );
    }).toList();
  }

  void apply(Map<Symbol, dynamic> args) {
    model.updateTheme(Function.apply(model.theme.copyWith, null, args));
  }

  void onColorChanged({TextStyle style, Color color, String styleName}) {
    final args = <Symbol, dynamic>{};
    final styleArgs = <Symbol, dynamic>{};
    styleArgs[Symbol(styleName)] = style.copyWith(color: color);
    args[Symbol(themeRef)] = Function.apply(txtTheme.copyWith, null, styleArgs);
    apply(args);
  }

  void onSizeChanged({TextStyle style, double size, String styleName}) {
    final args = <Symbol, dynamic>{};
    final styleArgs = <Symbol, dynamic>{};
    styleArgs[Symbol(styleName)] = style.copyWith(fontSize: size);
    args[Symbol(themeRef)] = Function.apply(txtTheme.copyWith, null, styleArgs);
    apply(args);
  }

  void onWeightChanged({TextStyle style, bool isBold, String styleName}) {
    final args = <Symbol, dynamic>{};
    final styleArgs = <Symbol, dynamic>{};
    styleArgs[Symbol(styleName)] = style.copyWith(
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal);
    args[Symbol(themeRef)] = Function.apply(txtTheme.copyWith, null, styleArgs);
    apply(args);
  }

  void onFontStyleChanged({TextStyle style, bool isItalic, String styleName}) {
    final args = <Symbol, dynamic>{};
    final styleArgs = <Symbol, dynamic>{};
    styleArgs[Symbol(styleName)] = style.copyWith(
        fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);
    args[Symbol(themeRef)] = Function.apply(txtTheme.copyWith, null, styleArgs);
    apply(args);
  }

  void onLetterSpacingChanged(
      {TextStyle style, double spacing, String styleName}) {
    final args = <Symbol, dynamic>{};
    final styleArgs = <Symbol, dynamic>{};
    styleArgs[Symbol(styleName)] = style.copyWith(letterSpacing: spacing);
    args[Symbol(themeRef)] = Function.apply(txtTheme.copyWith, null, styleArgs);
    apply(args);
  }

  void onWordSpacingChanged(
      {TextStyle style, double spacing, String styleName}) {
    final args = <Symbol, dynamic>{};
    final styleArgs = <Symbol, dynamic>{};
    styleArgs[Symbol(styleName)] = style.copyWith(wordSpacing: spacing);
    args[Symbol(themeRef)] = Function.apply(txtTheme.copyWith, null, styleArgs);
    apply(args);
  }

  void onLineHeightChanged({TextStyle style, double height, String styleName}) {
    final args = <Symbol, dynamic>{};
    final styleArgs = <Symbol, dynamic>{};
    styleArgs[Symbol(styleName)] = style.copyWith(height: height);
    args[Symbol(themeRef)] = Function.apply(txtTheme.copyWith, null, styleArgs);
    apply(args);
  }
}

class TextStyleControlData {
  final TextStyle style;
  final String styleName;

  TextStyleControlData({this.style, this.styleName});
}
