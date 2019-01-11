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

  final Color color;

  final Color backgroundColor;

  final double fontSize;

  final double maxFontSize;

  final double lineHeight;

  final bool isBold;

  final bool isItalic;

  final double letterSpacing;

  final double wordSpacing;

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
    /*@required this.onOpacityChanged,*/
    this.maxFontSize: 112.0,
  })  : this.color = style.color ?? Colors.black,
        this.backgroundColor = style.color ?? Colors.transparent,
        this.letterSpacing = style.letterSpacing ?? 1.0,
        this.lineHeight = style.height ?? 1.0,
        this.wordSpacing = style.wordSpacing ?? 1.0,
        this.fontSize = style.fontSize ?? 12.0,
        this.isBold = style.fontWeight == FontWeight.bold,
        this.isItalic = style.fontStyle == FontStyle.italic,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
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
          ],
        ),
      ),
    );
  }
}
