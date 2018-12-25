import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';
import '../../utils/constants.dart';
import '../color_swatch.dart';

class ColorSelector extends StatelessWidget {
  final String label;
  final Color value;
  final ValueChanged<Color> onSelection;
  final double padding;

  final double maxLabelWidth;

  ColorSelector(this.label, this.value, this.onSelection,
      {this.padding: 8.0, this.maxLabelWidth: 100});

  String get colorLabel {
    final namedPeer = namedColors().where((c) => c.color.value == value.value);
    return namedPeer.length > 0
        ? namedPeer.first.name
        : "#${value.value.toRadixString(16)}";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text.rich(
                TextSpan(
                    text: '$label\n',
                    style: Theme.of(context).textTheme.subtitle,
                    children: [
                      TextSpan(
                          text: colorLabel,
                          style: kDarkTextStyle.copyWith(height: 2))
                    ]),
              ),
            ),
            ColorSwatchControl(color: value, onSelection: onSelection),
          ],
        ),
      ),
    );
  }
}
