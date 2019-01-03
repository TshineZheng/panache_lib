import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';
import '../../utils/constants.dart';
import '../show_custom_menu.dart';

void openColorMenu(BuildContext context, {ValueChanged<Color> onSelection}) {
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
