import 'package:flutter/material.dart';

class SwitcherControl extends StatelessWidget {
  final String label;
  final String checkedLabel;
  final bool checked;
  final ValueChanged<bool> onChange;

  SwitcherControl({
    @required this.label,
    this.checkedLabel: '',
    this.checked,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final labelStyle = textTheme.subtitle;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Text(
            "$label",
            style: labelStyle,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Row(
            children: <Widget>[
              Switch(value: checked, onChanged: onChange),
              Text('$checkedLabel'),
            ],
          ),
        ),
      ],
    );
  }
}
