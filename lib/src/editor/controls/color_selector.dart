import 'package:flutter/material.dart';
import 'package:flutterial_components/src/utils/color_utils.dart';

import '../color_swatch.dart' as flutterial;

class ColorSelector extends StatelessWidget {
  final String label;
  final Color value;
  final ValueChanged<Color> onSelection;
  final double padding;

  ColorSelector(this.label, this.value, this.onSelection, {this.padding: 8.0});

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
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 100),
              child: Text(
                label,
                maxLines: 3,
                style: Theme.of(context).textTheme.subtitle,
              ),
            ),
            InkWell(
              onTap: () => openColorMenu(context, onSelection: onSelection),
              child: flutterial.ColorSwatch(value),
            ),
          ],
        ),
      ),
    );
  }
}
