import 'package:flutter/material.dart';

class SwitcherControl extends StatelessWidget {
  final String label;
  final String checkedLabel;
  final bool checked;
  final ValueChanged<bool> onChange;

  SwitcherControl({
    this.label,
    this.checkedLabel: '',
    this.checked,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final labelStyle = textTheme.subtitle;

    final children = <Widget>[
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
    ];
    if (label != null)
      children.insert(
          0,
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              "$label",
              style: labelStyle,
            ),
          ));

    return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: children);
  }
}
