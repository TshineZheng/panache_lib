import 'package:flutter/material.dart';

import '../color_utils.dart';
import 'color_swatch.dart' as flutterial;

class ColorSelector extends StatelessWidget {
  final String label;
  final Color value;
  final ColorChanged onSelection;

  ColorSelector(this.label, this.value, this.onSelection);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          color: Colors.grey.shade100,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConstrainedBox(
                    child: Text(
                      label,
                      maxLines: 3,
                      style: Theme.of(context).textTheme.body2,
                    ),
                    constraints: BoxConstraints.tightFor(width: 90.0)),
                InkWell(
                  onTap: () => openColorMenu(context, onSelection: onSelection),
                  child: flutterial.ColorSwatch(value),
                ),
              ],
            ),
          ),
        ),
      );
}
