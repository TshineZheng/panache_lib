import 'package:flutter/material.dart';
import 'package:flutterial_components/src/editor/controls/brightness_control.dart';
import 'package:flutterial_components/src/editor/controls/color_selector.dart';

Widget getFieldsRow(List<Widget> children) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: children.map((w) => Expanded(child: w)).toList(growable: false),
    );

Widget getColorBrightnessSelector(
        {String label,
        Color currentColor,
        ValueChanged<Color> changeHandler,
        bool isDark,
        ValueChanged<bool> brightnessChangeHandler}) =>
    Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: ColorSelector(label, currentColor, changeHandler)),
        BrightnessSelector(
            label: 'Brightness',
            isDark: isDark,
            onChange: brightnessChangeHandler)
      ],
    );

Widget getSwatchBrightnessSelector(
        {String label,
        ColorSwatch currentColor,
        ValueChanged<Color> changeHandler,
        bool isDark,
        ValueChanged<bool> brightnessChangeHandler}) =>
    Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: ColorSelector(label, currentColor, changeHandler)),
        BrightnessSelector(
            label: 'Brightness',
            isDark: isDark,
            onChange: brightnessChangeHandler)
      ],
    );

class FieldBorder extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const FieldBorder({
    Key key,
    this.child,
    this.padding: const EdgeInsets.symmetric(horizontal: 12.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: child);
  }
}
