import 'package:flutter/material.dart';

import 'constants.dart';

const materialColorsNames = [
  "red",
  "pink",
  "purple",
  "deepPurple",
  "indigo",
  "blue",
  "lightBlue",
  "cyan",
  "teal",
  "green",
  "lightGreen",
  "lime",
  "yellow",
  "amber",
  "orange",
  "deepOrange",
  "brown",
  "blueGrey",
  "White",
  "Black",
  "Grey"
];

Color getMaterialColor(String name) => namedColors()
    .firstWhere((c) => c.name == name,
        orElse: () =>
            NamedColor(name: name, color: Color(int.parse(name, radix: 16))))
    .color;

String getMaterialName(Color color) => namedColors()
    .firstWhere((c) => c.color.value == color.value,
        orElse: () =>
            NamedColor(name: color.value.toRadixString(16), color: color))
    .name;

bool isMaterialPrimary(Color color) {
  return namedColors().where((c) => c.color.value == color.value).isNotEmpty;
}

MaterialColor swatchFor({Color color}) {
  final found = Colors.primaries.where((c) => c.value == color.value);
  return found.isNotEmpty ? found.first : Colors.blue;
}

String swatchConstructorFor({Color color}) {
  final found = namedColors().firstWhere((c) => c.color.value == color.value);
  return 'Colors.${found.name}';
}

List<NamedColor> namedColors() {
  var colors = List<Color>.from(Colors.primaries, growable: true);
  colors.addAll([Colors.white, Colors.black, Colors.grey]);

  return colors.fold(
      [],
      (cumul, current) => cumul
        ..add(NamedColor(
            name: materialColorsNames[cumul.length], color: current)));
}

class NamedColor {
  final String name;
  final Color color;

  NamedColor({@required this.name, @required this.color});
}

bool isDark(Color c) => (c.red + c.green + c.blue) / 3 >= 146;

getMaterialSwatches(ValueChanged<Color> onSelection) {
  final colors = Colors.primaries.map((c) => c).toList();
  colors.addAll([
    Colors.white,
    Colors.black,
    Colors.grey,
  ]);

  return colors
      .map(
        (c) => InkWell(
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Container(
                  width: kSwatchSize,
                  height: kSwatchSize,
                  color: c,
                ),
              ),
              onTap: () => onSelection(c),
            ),
      )
      .toList();
}
