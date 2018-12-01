import 'dart:ui';
import 'package:flutter/material.dart';

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

class NamedColor {
  final String name;
  final Color color;

  NamedColor({@required this.name, @required this.color});
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

bool isDark(Color c) => (c.red + c.green + c.blue) / 3 >= 146;
