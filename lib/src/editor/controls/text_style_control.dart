import 'package:flutter/material.dart';
import 'package:panache_lib/src/editor/controls/control_container.dart';
import 'package:panache_lib/src/editor/controls/slider_control.dart';
import 'package:panache_lib/src/editor/controls/switcher_control.dart';

import '../editor_utils.dart';
import 'color_selector.dart';
import 'font_size_slider.dart';

class TextStyleControl extends StatelessWidget {
  final String label;

  final ValueChanged<Color> onColorChanged;

  final ValueChanged<double> onSizeChanged;

  final ValueChanged<double> onLetterSpacingChanged;

  final ValueChanged<double> onWordSpacingChanged;

  final ValueChanged<double> onLineHeightChanged;

  // TODO select from all FontWeight values
  final ValueChanged<bool> onWeightChanged;

  final ValueChanged<bool> onFontStyleChanged;

  final ValueChanged<TextDecoration> onDecorationChanged;

  final ValueChanged<TextDecorationStyle> onDecorationStyleChanged;

  final ValueChanged<Color> onDecorationColorChanged;

  final Color color;

  final Color backgroundColor;

  final double fontSize;

  final double maxFontSize;

  final double lineHeight;

  final bool isBold;

  final bool isItalic;

  final double letterSpacing;

  final double wordSpacing;

  final TextDecoration decoration;

  final TextDecorationStyle decorationStyle;

  final Color decorationColor;

  final TextStyle style;

  TextStyleControl(
    this.label, {
    Key key,
    @required this.style,
    @required this.onColorChanged,
    @required this.onSizeChanged,
    @required this.onWeightChanged,
    @required this.onFontStyleChanged,
    @required this.onLetterSpacingChanged,
    @required this.onWordSpacingChanged,
    @required this.onLineHeightChanged,
    @required this.onDecorationChanged,
    @required this.onDecorationStyleChanged,
    @required this.onDecorationColorChanged,
    this.maxFontSize: 112.0,
  })  : this.color = style.color ?? Colors.black,
        this.backgroundColor = style.color ?? Colors.transparent,
        this.letterSpacing = style.letterSpacing ?? 1.0,
        this.lineHeight = style.height ?? 1.0,
        this.wordSpacing = style.wordSpacing ?? 1.0,
        this.fontSize = style.fontSize ?? 12.0,
        this.decoration = style.decoration ?? TextDecoration.none,
        this.decorationStyle =
            style.decorationStyle ?? TextDecorationStyle.solid,
        this.decorationColor = style.decorationColor ?? style.color,
        this.isBold = style.fontWeight == FontWeight.bold,
        this.isItalic = style.fontStyle == FontStyle.italic,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 6.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                label,
                style: textTheme.title,
                textAlign: TextAlign.left,
              ),
            ),
            getFieldsRow([
              ColorSelector(
                'Color',
                color,
                onColorChanged,
                padding: 0,
              ),
              FontSizeSelector(
                fontSize,
                onSizeChanged,
                min: 8.0,
                max: maxFontSize,
                vertical: true,
              )
            ]),
            getFieldsRow([
              ControlContainerBorder(
                child: SwitcherControl(
                    checked: isBold,
                    checkedLabel: 'Bold',
                    onChange: onWeightChanged),
              ),
              ControlContainerBorder(
                child: SwitcherControl(
                    checked: isItalic,
                    checkedLabel: 'Italic',
                    onChange: onFontStyleChanged),
              ),
              SliderPropertyControl(
                lineHeight,
                onLineHeightChanged,
                label: 'Line height',
                min: 1,
                max: 3,
                showDivisions: false,
                vertical: true,
              ),
            ]),
            getFieldsRow([
              SliderPropertyControl(
                letterSpacing,
                onLetterSpacingChanged,
                label: 'Letter spacing',
                min: -5,
                max: 5,
                showDivisions: false,
                vertical: true,
              ),
              SliderPropertyControl(
                wordSpacing,
                onWordSpacingChanged,
                label: 'Word spacing',
                min: -5,
                max: 5,
                showDivisions: false,
                vertical: true,
              ),
            ]),
            getFieldsRow([
              PanacheDropdown<SelectionItem<TextDecoration>>(
                label: 'Decoration',
                selection: style.decorationStyle != null
                    ? _textDecorations
                        .firstWhere((item) => item.value == style.decoration)
                    : _textDecorations.first,
                collection: _textDecorations,
                onValueChanged: (decoration) =>
                    onDecorationChanged(decoration.value),
              ),
              PanacheDropdown<SelectionItem<TextDecorationStyle>>(
                label: 'Decoration style',
                selection: style.decorationStyle != null
                    ? _textDecorationStyles.firstWhere(
                        (item) => item.value == style.decorationStyle)
                    : _textDecorationStyles.first,
                collection: _textDecorationStyles,
                onValueChanged: (decorationStyle) =>
                    onDecorationStyleChanged(decorationStyle.value),
              ),
              ColorSelector(
                  'Decoration color',
                  style.decorationColor ?? Colors.black,
                  onDecorationColorChanged)
            ]),
          ],
        ),
      ),
    );
  }
}

const _textDecorationStyles = [
  SelectionItem<TextDecorationStyle>('Solid', TextDecorationStyle.solid),
  SelectionItem<TextDecorationStyle>('Dashed', TextDecorationStyle.dashed),
  SelectionItem<TextDecorationStyle>('Dotted', TextDecorationStyle.dotted),
  SelectionItem<TextDecorationStyle>('Wavy', TextDecorationStyle.wavy),
  SelectionItem<TextDecorationStyle>('Double', TextDecorationStyle.double),
];

const _textDecorations = [
  SelectionItem<TextDecoration>('None', TextDecoration.none),
  SelectionItem<TextDecoration>('underline', TextDecoration.underline),
  SelectionItem<TextDecoration>('Linethrough', TextDecoration.lineThrough),
  SelectionItem<TextDecoration>('Overline', TextDecoration.overline),
];

class SelectionItem<T> {
  final String label;
  final T value;

  const SelectionItem(this.label, this.value);
}

class PanacheDropdown<D extends SelectionItem> extends StatelessWidget {
  final List<D> collection;

  final D selection;

  final String label;
  final ValueChanged<D> onValueChanged;

  const PanacheDropdown(
      {Key key,
      @required this.collection,
      @required this.onValueChanged,
      @required this.selection,
      this.label: ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ControlContainerBorder(
        child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 2.0, bottom: 8.0),
          child: Text(
            label,
            style: textTheme.subtitle,
          ),
        ),
        DropdownButton(
            items: buildItems(
              style: textTheme.body2,
            ),
            isDense: true,
            value: selection,
            hint: Text(
              label,
              style: textTheme.body2,
            ),
            onChanged: onValueChanged),
      ],
    ));
  }

  List<DropdownMenuItem<D>> buildItems({TextStyle style}) => collection
      .map<DropdownMenuItem<D>>((item) => toDropdownMenuItem(item, style))
      .toList(growable: false);

  DropdownMenuItem<D> toDropdownMenuItem(D item, TextStyle style) =>
      DropdownMenuItem(
        child: Text(item.label, style: style),
        value: item,
      );
}
