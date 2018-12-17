import 'package:flutter/material.dart';

import '../../color_utils.dart';
import '../color_swatch.dart' as flutterial;

class ColorSelector extends StatelessWidget {
  final String label;
  final Color value;
  final ValueChanged<Color> onSelection;

  ColorSelector(this.label, this.value, this.onSelection);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(8.0),
          color: Colors.grey.shade100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  label,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.body2,
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
