import 'package:flutter/material.dart';

import 'converter_utils.dart';

String iconThemeToCode(IconThemeData iconTheme) {
  return '''IconThemeData(
      color: ${colorToCode(iconTheme.color)},
      opacity: ${iconTheme.opacity},
      size: ${iconTheme.size},
    )''';
}

Map<String, dynamic> iconThemeToMap(IconThemeData theme) {
  return {
    'color': theme.color.value,
    'opacity': '${theme.opacity}',
    'size': '${theme.size}',
  };
}

IconThemeData iconThemeFromMap(Map<String, dynamic> data) {
  return IconThemeData(
      color: Color(data['color']),
      opacity: double.parse(data['opacity']),
      size: double.parse(data['size']));
}
