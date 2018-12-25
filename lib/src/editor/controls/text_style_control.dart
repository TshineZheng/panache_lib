import 'package:flutter/material.dart';

import '../editor_utils.dart';
import 'color_selector.dart';
import 'font_size_slider.dart';

class TextStyleControl extends StatelessWidget {
  final String label;

  final ValueChanged<Color> onColorChanged;

  final ValueChanged<double> onSizeChanged;

  // TODO select from all FontWeight values
  final ValueChanged<bool> onWeightChanged;

  final ValueChanged<bool> onFontStyleChanged;

  final Color color;

  final double fontSize;

  final double maxFontSize;

  final bool isBold;

  final bool isItalic;

  //final _fontWeights = [];

  TextStyleControl(
    this.label, {
    Key key,
    @required this.onColorChanged,
    @required this.onSizeChanged,
    @required this.onWeightChanged,
    @required this.onFontStyleChanged,
    @required this.color,
    @required this.fontSize,
    @required this.isBold,
    @required this.isItalic,
    this.maxFontSize: 112.0,
  }) : super(key: key);

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
              padding: const EdgeInsets.only(bottom: 8.0),
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
              ),
            ]),
            getFieldsRow([
              Row(
                children: [
                  Text(
                    'FontWeight ',
                    style: textTheme.subtitle,
                  ),
                  Switch(value: isBold, onChanged: onWeightChanged),
                  Text(' Bold'),
                ],
              ),
              Row(
                children: [
                  Text(
                    'FontStyle ',
                    style: textTheme.subtitle,
                  ),
                  Switch(value: isItalic, onChanged: onFontStyleChanged),
                  Text(' Italic'),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
