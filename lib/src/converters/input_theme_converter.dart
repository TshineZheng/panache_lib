import 'package:flutter/material.dart';

import 'converter_utils.dart';
import 'text_theme_converters.dart';

String inputDecorationThemeToCode(InputDecorationTheme inputTheme,
    Color hintColor, TextStyle bodyStyle, Brightness brightness) {
  final defaultHintStyle = TextStyle(color: hintColor).merge(bodyStyle);

  return '''
  InputDecorationTheme(
    labelStyle: ${textStyleToCode(inputTheme.labelStyle ?? defaultHintStyle)},
    helperStyle: ${textStyleToCode(inputTheme.helperStyle ?? defaultHintStyle)},
    hintStyle: ${textStyleToCode(inputTheme.hintStyle ?? defaultHintStyle)},
    errorStyle: ${textStyleToCode(inputTheme.errorStyle ?? defaultHintStyle)},
    errorMaxLines: ${inputTheme.errorMaxLines},
    hasFloatingPlaceholder: ${inputTheme.hasFloatingPlaceholder},
    isDense: ${inputTheme.isDense},
    contentPadding: ${paddingToCode(inputTheme.contentPadding ?? getDefaultContentPadding(inputTheme))},
    isCollapsed : ${inputTheme.isCollapsed},
    prefixStyle: ${textStyleToCode(inputTheme.prefixStyle ?? defaultHintStyle)},
    suffixStyle: ${textStyleToCode(inputTheme.suffixStyle ?? defaultHintStyle)},
    counterStyle: ${textStyleToCode(inputTheme.counterStyle ?? defaultHintStyle)},
    filled: ${inputTheme.filled},
    fillColor: ${colorToCode(_getFillColor(inputTheme, brightness))},
    errorBorder: ${inputBorderToCode(inputTheme.errorBorder ?? inputTheme.border)},
    focusedBorder: ${inputBorderToCode(inputTheme.focusedBorder ?? inputTheme.border)},
    focusedErrorBorder: ${inputBorderToCode(inputTheme.focusedErrorBorder ?? inputTheme.border)},
    disabledBorder: ${inputBorderToCode(inputTheme.disabledBorder ?? inputTheme.border)},
    enabledBorder: ${inputBorderToCode(inputTheme.enabledBorder ?? inputTheme.border)},
    border: ${inputBorderToCode(inputTheme.border)},
  )''';
}

Color _getFillColor(InputDecorationTheme theme, Brightness brightness) {
  if (theme.filled != true) return Colors.transparent;
  if (theme.fillColor != null) return theme.fillColor;

  // dark theme: 10% white (enabled), 5% white (disabled)
  // light theme: 4% black (enabled), 2% black (disabled)
  const Color darkEnabled = Color(0x1AFFFFFF);
  const Color lightEnabled = Color(0x0A000000);

  switch (brightness) {
    case Brightness.dark:
      return darkEnabled;
    case Brightness.light:
      return lightEnabled;
  }
  return lightEnabled;
}

String inputBorderToCode(InputBorder border) {
  if (border is UnderlineInputBorder) {
    return '''UnderlineInputBorder(
      side: ${borderSideToCode(border.borderSide)},
      borderRadius: BorderRadius.all(${border.borderRadius.topLeft}),
    )''';
  }
  if (border is OutlineInputBorder) {
    return '''OutlineInputBorder(
      side: ${borderSideToCode(border.borderSide)},
      borderRadius: BorderRadius.all(${border.borderRadius.topLeft}),
      gapPadding: ${border.gapPadding}
    )''';
  }
  if (border is InputBorder || border == null) {
    return '''InputBorder.none''';
  }

  throw Exception('Unknown InputBorder $border');
}

Map<String, dynamic> inputDecorationThemeToMap(
  InputDecorationTheme inputTheme,
  Color hintColor,
  TextStyle bodyStyle,
  Brightness brightness,
) {
  final defaultHintStyle = TextStyle(color: hintColor).merge(bodyStyle);
  return {
    'labelStyle': textStyleToMap(inputTheme.labelStyle ?? defaultHintStyle),
    'helperStyle': textStyleToMap(inputTheme.helperStyle ?? defaultHintStyle),
    'hintStyle': textStyleToMap(inputTheme.hintStyle ?? defaultHintStyle),
    'errorStyle': textStyleToMap(inputTheme.errorStyle ?? defaultHintStyle),
    'errorMaxLines': inputTheme.errorMaxLines,
    'hasFloatingPlaceholder': inputTheme.hasFloatingPlaceholder,
    'isDense': inputTheme.isDense,
    'contentPadding': paddingToMap(
        inputTheme.contentPadding ?? getDefaultContentPadding(inputTheme)),
    'isCollapsed': inputTheme.isCollapsed,
    'prefixStyle': textStyleToMap(inputTheme.prefixStyle ?? defaultHintStyle),
    'suffixStyle': textStyleToMap(inputTheme.suffixStyle ?? defaultHintStyle),
    'counterStyle': textStyleToMap(inputTheme.counterStyle ?? defaultHintStyle),
    'filled': inputTheme.filled,
    'fillColor': _getFillColor(inputTheme, brightness).value,
    'errorBorder': inputBorderToMap(inputTheme.errorBorder),
    'focusedBorder': inputBorderToMap(inputTheme.focusedBorder),
    'focusedErrorBorder': inputBorderToMap(inputTheme.focusedErrorBorder),
    'disabledBorder': inputBorderToMap(inputTheme.disabledBorder),
    'enabledBorder': inputBorderToMap(inputTheme.enabledBorder),
    'border': inputBorderToMap(inputTheme.border)
  };
}

Map<String, dynamic> inputBorderToMap(InputBorder border) {
  final type = getInputBorderType(border);

  if (border is UnderlineInputBorder) {
    return {
      'type': type,
      'radius': borderRadiusToMap(border.borderRadius),
      'side': borderSideToMap(border.borderSide)
    };
  }

  if (border is OutlineInputBorder) {
    return {
      'type': type,
      'radius': borderRadiusToMap(border.borderRadius),
      'side': borderSideToMap(border.borderSide),
      'gapPadding': border.gapPadding
    };
  }

  if (border is InputBorder || border == null) {
    return {'type': type};
  }

  throw Exception('Unknown InputBorder $border');
}

InputDecorationTheme inputDecorationThemeFromMap(Map<String, dynamic> data) {
  return InputDecorationTheme(
      labelStyle: textStyleFromMap(data['labelStyle']),
      helperStyle: textStyleFromMap(data['helperStyle']),
      hintStyle: textStyleFromMap(data['hintStyle']),
      errorStyle: textStyleFromMap(data['errorStyle']),
      errorMaxLines: data['errorMaxLines'],
      hasFloatingPlaceholder: data['hasFloatingPlaceholder'],
      isDense: data['isDense'],
      contentPadding: paddingFromMap(data['contentPadding']),
      isCollapsed: data['isCollapsed'],
      prefixStyle: textStyleFromMap(data['prefixStyle']),
      suffixStyle: textStyleFromMap(data['suffixStyle']),
      counterStyle: textStyleFromMap(data['counterStyle']),
      filled: data['filled'],
      fillColor: Color(data['fillColor']),
      errorBorder: inputBorderFromMap(data['errorBorder']),
      focusedBorder: inputBorderFromMap(data['focusedBorder']),
      focusedErrorBorder: inputBorderFromMap(data['focusedErrorBorder']),
      disabledBorder: inputBorderFromMap(data['disabledBorder']),
      enabledBorder: inputBorderFromMap(data['enabledBorder']),
      border: inputBorderFromMap(data['border']));
}

InputBorder inputBorderFromMap(Map<String, dynamic> data) {
  if (data['type'] == 'UnderlineInputBorder') {
    return UnderlineInputBorder(
        borderRadius: borderRadiusFromMap(data['borderRadius']),
        borderSide: borderSideFromMap(data['borderSide']));
  }

  if (data['type'] == 'OutlineInputBorder') {
    return OutlineInputBorder(
        borderRadius: borderRadiusFromMap(data['borderRadius']),
        borderSide: borderSideFromMap(data['borderSide']),
        gapPadding: data['gapPadding']);
  }

  if (data['type'] == 'None') {
    return InputBorder.none;
  }

  throw Exception('Unknown InputBorder $data');
}

String getInputBorderType(InputBorder border) {
  if (border is UnderlineInputBorder) return 'UnderlineInputBorder';
  if (border is OutlineInputBorder) return 'OutlineInputBorder';
  if (border is InputBorder || border == null) return 'None';

  throw Exception('Unknown InputBorder type $border');
}

EdgeInsets getDefaultContentPadding(InputDecorationTheme theme) {
  EdgeInsets contentPadding;
  double floatingLabelHeight;

  if (theme.isCollapsed) {
    floatingLabelHeight = 0.0;
    contentPadding = theme.contentPadding ?? EdgeInsets.zero;
  } else if (getInputBorderType(theme.border) != 'OutlineInputBorder') {
    // 4.0: the vertical gap between the inline elements and the floating label.
    floatingLabelHeight = (4.0 + 0.75 * (theme.labelStyle?.fontSize ?? 14.0));
    if (theme.filled == true) {
      // filled == null same as filled == false
      contentPadding = theme.contentPadding ??
          (theme.isDense
              ? const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0)
              : const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0));
    } else {
      // Not left or right padding for underline borders that aren't filled
      // is a small concession to backwards compatibility. This eliminates
      // the most noticeable layout change introduced by #13734.
      contentPadding = theme.contentPadding ??
          (theme.isDense
              ? const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0)
              : const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0));
    }
  } else {
    floatingLabelHeight = 0.0;
    contentPadding = theme.contentPadding ??
        (theme.isDense
            ? const EdgeInsets.fromLTRB(12.0, 20.0, 12.0, 12.0)
            : const EdgeInsets.fromLTRB(12.0, 24.0, 12.0, 16.0));
  }
  return contentPadding;
}
