import 'package:flutter/material.dart';
import 'package:panache_lib/src/editor/controls/control_container.dart';

import '../../utils/color_utils.dart';
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
    final textTheme = Theme.of(context).textTheme;
    return ControlContainerBorder(
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
                        style: textTheme.overline.copyWith(height: 1.5)
                        /*kDarkTextStyle.copyWith(height: 2)*/)
                  ]),
            ),
          ),
          ColorSwatchControl(color: value, onSelection: onSelection),
        ],
      ),
    );
  }
}
