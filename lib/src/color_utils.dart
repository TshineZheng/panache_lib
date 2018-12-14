import 'package:flutter/material.dart';

import './editor/show_custom_menu.dart';
import 'constants.dart';

typedef void ColorChanged(Color c);

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

getMaterialSwatches(ColorChanged onSelection) {
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

List<PopupMenuItem<Color>> getColorMenuItems() {
  final colors = Colors.primaries.map((c) => c).toList();
  colors.addAll([
    Colors.white,
    Colors.black,
    Colors.grey,
  ]);

  return colors
      .map(
        (c) => PopupMenuItem<Color>(
              value: c,
              child: Container(
                width: kSwatchSize,
                height: kSwatchSize,
                color: c,
              ),
            ),
      )
      .toList();
}

List<PopupGridMenuItem<Color>> getColorMenuTileItems() => namedColors()
    .map(
      (c) => PopupGridMenuItem<Color>(
            value: c.color,
            child: GridTile(
              footer: Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(c.name,
                    style: isDark(c.color) ? kDarkTextStyle : kLightTextStyle),
              ),
              child: Container(
                width: kSwatchSize,
                height: kSwatchSize,
                color: c.color,
              ),
            ),
          ),
    )
    .toList();

void openColorMenu(BuildContext context, {ColorChanged onSelection}) {
  final RenderBox renderBox = context.findRenderObject();
  final Offset topLeft = renderBox?.localToGlobal(Offset.zero);

  showGridMenu<Color>(
    context: context,
    elevation: 2.0,
    items: getColorMenuTileItems(),
    position: RelativeRect.fromLTRB(
      topLeft.dx,
      topLeft.dy,
      0.0,
      0.0,
    ),
  ).then<Null>(
    (Color newValue) {
      if (newValue == null) return null;
      if (onSelection != null) onSelection(newValue);
    },
  );
}
