import 'package:flutter/material.dart';

import 'converter_utils.dart';
import 'text_theme_converters.dart';

String inputDecorationThemeToCode(InputDecorationTheme inputTheme) {
  return '''
  InputDecorationTheme(
    labelStyle: ${textStyleToCode(inputTheme.labelStyle)},
    helperStyle: ${textStyleToCode(inputTheme.helperStyle)},
    hintStyle: ${textStyleToCode(inputTheme.hintStyle)},
    errorStyle: ${textStyleToCode(inputTheme.errorStyle)},
    errorMaxLines: ${inputTheme.errorMaxLines},
    hasFloatingPlaceholder: ${inputTheme.hasFloatingPlaceholder},
    isDense: ${inputTheme.isDense},
    contentPadding: ${paddingToCode(inputTheme.contentPadding)},
    isCollapsed : ${inputTheme.isCollapsed},
    prefixStyle: ${textStyleToCode(inputTheme.prefixStyle)},
    suffixStyle: ${textStyleToCode(inputTheme.suffixStyle)},
    counterStyle: ${textStyleToCode(inputTheme.counterStyle)},
    filled: ${inputTheme.filled},
    fillColor: ${colorToCode(inputTheme.fillColor)},
    errorBorder: ${inputBorderToCode(inputTheme.errorBorder)},
    focusedBorder: ${inputBorderToCode(inputTheme.focusedBorder)},
    focusedErrorBorder: ${inputBorderToCode(inputTheme.focusedErrorBorder)},
    disabledBorder: ${inputBorderToCode(inputTheme.disabledBorder)},
    enabledBorder: ${inputBorderToCode(inputTheme.enabledBorder)},
    border: ${inputBorderToCode(inputTheme.border)},
  )''';
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

  throw Exception('Unknown InputBorder $border');
}

Map<String, dynamic> inputDecorationThemeToMap(
    InputDecorationTheme inputTheme) {
  return {
    'labelStyle': textStyleToMap(inputTheme.labelStyle),
    'helperStyle': textStyleToMap(inputTheme.helperStyle),
    'hintStyle': textStyleToMap(inputTheme.hintStyle),
    'errorStyle': textStyleToMap(inputTheme.errorStyle),
    'errorMaxLines': inputTheme.errorMaxLines,
    'hasFloatingPlaceholder': inputTheme.hasFloatingPlaceholder,
    'isDense': inputTheme.isDense,
    'contentPadding': paddingToMap(inputTheme.contentPadding),
    'isCollapsed ': inputTheme.isCollapsed,
    'prefixStyle': textStyleToMap(inputTheme.prefixStyle),
    'suffixStyle': textStyleToMap(inputTheme.suffixStyle),
    'counterStyle': textStyleToMap(inputTheme.counterStyle),
    'filled': inputTheme.filled,
    'fillColor': inputTheme.fillColor.value,
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

  throw Exception('Unknown InputBorder $data');
}

String getInputBorderType(InputBorder border) {
  if (border is UnderlineInputBorder) return 'UnderlineInputBorder';
  if (border is OutlineInputBorder) return 'OutlineInputBorder';

  throw Exception('Unknown InputBorder type $border');
}
