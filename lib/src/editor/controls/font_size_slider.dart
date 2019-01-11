import 'package:flutter/material.dart';

import 'control_container.dart';

class FontSizeSelector extends StatefulWidget {
  final double value;
  final double min;
  final double max;
  final bool vertical;
  final ValueChanged<double> onValueChanged;

  FontSizeSelector(this.value, this.onValueChanged,
      {this.min: 0.0, this.max: 112.0, this.vertical})
      : assert(value != null),
        assert(min != null),
        assert(max != null),
        assert(min <= max);

  @override
  FontSizeSelectorState createState() {
    return new FontSizeSelectorState();
  }
}

class FontSizeSelectorState extends State<FontSizeSelector> {
  double visibleValue;

  @override
  void initState() {
    super.initState();
    visibleValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ControlContainerBorder(
      child: Flex(
        direction: widget.vertical ? Axis.vertical : Axis.horizontal,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 160.0),
            child: Slider(
              value: visibleValue,
              onChanged: (currentValue) =>
                  setState(() => visibleValue = currentValue),
              onChangeEnd: widget.onValueChanged,
              divisions: (widget.max - widget.min) ~/ 2,
              min: widget.min,
              max: widget.max,
              label: '${visibleValue.toStringAsFixed(0)}',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                text: TextSpan(
                    text: 'Font size ',
                    style: textTheme.subtitle,
                    children: [
                      TextSpan(
                        text: widget.value.toStringAsFixed(1),
                        style: textTheme.body1,
                      )
                    ]),
              ),
              /*Text("Font size : ${value.toStringAsFixed(1)}"),*/
            ],
          ),
        ],
      ),
    );
  }
}
