import 'dart:convert';

import 'package:flutter/material.dart';

import '../utils/color_utils.dart';
import 'button_theme_converters.dart';
import 'converter_utils.dart';
import 'icon_theme_converter.dart';
import 'text_theme_converters.dart';

final defaultLightTheme =
    ThemeData.localize(ThemeData.light(), Typography.englishLike2018);

final defaultDarkTheme =
    ThemeData.localize(ThemeData.dark(), Typography.englishLike2018);

String themeToCode(ThemeData theme) {
  return '''
  import 'package:flutter/material.dart';
  final ThemeData myTheme = ThemeData(
    primarySwatch: ${swatchConstructorFor(color: theme.primaryColor)},
    brightness: ${theme.brightness},
    primaryColor: ${colorToCode(theme.primaryColor)},
    primaryColorBrightness: ${theme.primaryColorBrightness},
    primaryColorLight: ${colorToCode(theme.primaryColorLight)},
    primaryColorDark: ${colorToCode(theme.primaryColorDark)},
    accentColor: ${colorToCode(theme.accentColor)},
    accentColorBrightness: ${theme.accentColorBrightness},
    canvasColor: ${colorToCode(theme.canvasColor)},
    scaffoldBackgroundColor: ${colorToCode(theme.scaffoldBackgroundColor)},
    bottomAppBarColor: ${colorToCode(theme.bottomAppBarColor)},
    cardColor: ${colorToCode(theme.cardColor)},
    dividerColor: ${colorToCode(theme.dividerColor)},
    highlightColor: ${colorToCode(theme.highlightColor)},
    splashColor: ${colorToCode(theme.splashColor)},
    selectedRowColor: ${colorToCode(theme.selectedRowColor)},
    unselectedWidgetColor: ${colorToCode(theme.unselectedWidgetColor)},
    disabledColor: ${colorToCode(theme.disabledColor)},
    buttonColor: ${colorToCode(theme.buttonColor)},
    toggleableActiveColor: ${colorToCode(theme.toggleableActiveColor)},
    secondaryHeaderColor: ${colorToCode(theme.secondaryHeaderColor)},
    textSelectionColor: ${colorToCode(theme.textSelectionColor)},
    cursorColor: ${colorToCode(theme.cursorColor)},
    textSelectionHandleColor: ${colorToCode(theme.textSelectionHandleColor)},
    backgroundColor: ${colorToCode(theme.backgroundColor)},
    dialogBackgroundColor: ${colorToCode(theme.dialogBackgroundColor)},
    indicatorColor: ${colorToCode(theme.indicatorColor)},
    hintColor: ${colorToCode(theme.hintColor)},
    errorColor: ${colorToCode(theme.errorColor)},
    buttonTheme: ${buttonThemeToCode(theme.buttonTheme)},
    textTheme: ${textThemeToCode(theme.textTheme)},
    primaryTextTheme: ${textThemeToCode(theme.primaryTextTheme)},
    accentTextTheme: ${textThemeToCode(theme.accentTextTheme)},
    iconTheme: ${iconThemeToCode(theme.iconTheme)},
    primaryIconTheme: ${iconThemeToCode(theme.primaryIconTheme)},
    accentIconTheme: ${iconThemeToCode(theme.accentIconTheme)},
    sliderTheme: ${sliderThemeToCode(theme.sliderTheme)},
    tabBarTheme: ${tabBarThemeToCode(theme.tabBarTheme)},
    chipTheme: ${chipThemeToCode(theme.chipTheme)},
    dialogTheme: ${dialogThemeToCode(theme.dialogTheme)},
  );
''';
}
/*
    TODO
    colorScheme: ${theme.colorScheme},
    splashFactory: ${theme.splashFactory},
    materialTapTargetSize: ${theme.materialTapTargetSize},
    pageTransitionsTheme: ${theme.pageTransitionsTheme},
    platform: ${theme.platform},
 */

Map<String, dynamic> themeToMap(ThemeData theme) {
  return <String, dynamic>{
    "primarySwatch": theme.primaryColor.value,
    'brightness': brightnessIndex(theme.brightness),
    'primaryColor': theme.primaryColor.value,
    'primaryColorBrightness': brightnessIndex(theme.primaryColorBrightness),
    'primaryColorLight': theme.primaryColorLight.value,
    'primaryColorDark': theme.primaryColorDark.value,
    'accentColor': theme.accentColor.value,
    'accentColorBrightness': brightnessIndex(theme.accentColorBrightness),
    'canvasColor': theme.canvasColor.value,
    'scaffoldBackgroundColor': theme.scaffoldBackgroundColor.value,
    'bottomAppBarColor': theme.bottomAppBarColor.value,
    'cardColor': theme.cardColor.value,
    'dividerColor': theme.dividerColor.value,
    'highlightColor': theme.highlightColor.value,
    'splashColor': theme.splashColor.value,
    'selectedRowColor': theme.selectedRowColor.value,
    'unselectedWidgetColor': theme.unselectedWidgetColor.value,
    'disabledColor': theme.disabledColor.value,
    'buttonColor': theme.buttonColor.value,
    'toggleableActiveColor': theme.toggleableActiveColor.value,
    'secondaryHeaderColor': theme.secondaryHeaderColor.value,
    'textSelectionColor': theme.textSelectionColor.value,
    'cursorColor': theme.cursorColor.value,
    'textSelectionHandleColor': theme.textSelectionHandleColor.value,
    'backgroundColor': theme.backgroundColor.value,
    'dialogBackgroundColor': theme.dialogBackgroundColor.value,
    'indicatorColor': theme.indicatorColor.value,
    'hintColor': theme.hintColor.value,
    'errorColor': theme.errorColor.value,
    'buttonTheme': buttonThemeToMap(theme.buttonTheme),
    'textTheme': textThemeToMap(theme.textTheme),
    'iconTheme': iconThemeToMap(theme.iconTheme),
    'primaryIconTheme': iconThemeToMap(theme.primaryIconTheme),
    'accentIconTheme': iconThemeToMap(theme.accentIconTheme),
    'sliderTheme': sliderThemeToMap(theme.sliderTheme),
    /* FIXME
      'tabBarTheme': '${tabBarThemeToCode(theme.tabBarTheme)}',
      'chipTheme': '${chipThemeToCode(theme.chipTheme)}',
      'dialogTheme': '${dialogThemeToCode(theme.dialogTheme)}',
      'primaryTextTheme': '${textThemeToCode(theme.primaryTextTheme)}',
      'accentTextTheme': '${textThemeToCode(theme.accentTextTheme)}',
      'platform': _theme.platform == TargetPlatform.iOS ? 'iOS' : 'android',*/
  };
}

ThemeData themeFromJson(String jsonTheme) {
  final Map<String, dynamic> themeMap = json.decode(jsonTheme);
  return ThemeData(
      primarySwatch: swatchFor(color: Color(themeMap['primarySwatch'])),
      brightness: Brightness.values[themeMap['brightness']],
      primaryColor: Color(themeMap['primaryColor']),
      primaryColorBrightness:
          Brightness.values[themeMap['primaryColorBrightness']],
      primaryColorLight: Color(themeMap['primaryColorLight']),
      primaryColorDark: Color(themeMap['primaryColorDark']),
      accentColor: Color(themeMap['accentColor']),
      accentColorBrightness:
          Brightness.values[themeMap['accentColorBrightness']],
      canvasColor: Color(themeMap['canvasColor']),
      scaffoldBackgroundColor: Color(themeMap['scaffoldBackgroundColor']),
      bottomAppBarColor: Color(themeMap['bottomAppBarColor']),
      cardColor: Color(themeMap['cardColor']),
      dividerColor: Color(themeMap['dividerColor']),
      highlightColor: Color(themeMap['highlightColor']),
      splashColor: Color(themeMap['splashColor']),
      selectedRowColor: Color(themeMap['selectedRowColor']),
      unselectedWidgetColor: Color(themeMap['unselectedWidgetColor']),
      disabledColor: Color(themeMap['disabledColor']),
      buttonColor: Color(themeMap['buttonColor']),
      toggleableActiveColor: Color(themeMap['toggleableActiveColor']),
      secondaryHeaderColor: Color(themeMap['secondaryHeaderColor']),
      textSelectionColor: Color(themeMap['textSelectionColor']),
      cursorColor: Color(themeMap['cursorColor']),
      textSelectionHandleColor: Color(themeMap['textSelectionHandleColor']),
      backgroundColor: Color(themeMap['backgroundColor']),
      dialogBackgroundColor: Color(themeMap['dialogBackgroundColor']),
      indicatorColor: Color(themeMap['indicatorColor']),
      hintColor: Color(themeMap['hintColor']),
      errorColor: Color(themeMap['errorColor']),
      buttonTheme: buttonThemeFromMap(themeMap['buttonTheme']),
      textTheme: textThemeFromMap(themeMap['textTheme']),
      iconTheme: iconThemeFromMap(themeMap['iconTheme']),
      primaryIconTheme: iconThemeFromMap(themeMap['primaryIconTheme']),
      accentIconTheme: iconThemeFromMap(themeMap['accentIconTheme']),
      /*FIXME*/
      sliderTheme: defaultLightTheme.sliderTheme,
      tabBarTheme: defaultLightTheme.tabBarTheme,
      chipTheme: defaultLightTheme.chipTheme,
      dialogTheme: defaultLightTheme.dialogTheme,
      primaryTextTheme: defaultLightTheme.primaryTextTheme,
      accentTextTheme: defaultLightTheme.accentTextTheme,
      platform: defaultLightTheme.platform);
}

int brightnessIndex(Brightness value) =>
    Brightness.values.indexOf(value) ?? Brightness.light;

String sliderThemeToCode(SliderThemeData sliderTheme) {
  return '''SliderThemeData(
      activeTrackColor: ${colorToCode(sliderTheme.activeTrackColor)},
      inactiveTrackColor: ${colorToCode(sliderTheme.inactiveTrackColor)},
      disabledActiveTrackColor: ${colorToCode(sliderTheme.disabledActiveTrackColor)},
      disabledInactiveTrackColor: ${colorToCode(sliderTheme.disabledInactiveTrackColor)},
      activeTickMarkColor: ${colorToCode(sliderTheme.activeTickMarkColor)},
      inactiveTickMarkColor: ${colorToCode(sliderTheme.inactiveTickMarkColor)},
      disabledActiveTickMarkColor: ${colorToCode(sliderTheme.disabledActiveTickMarkColor)},
      disabledInactiveTickMarkColor: ${colorToCode(sliderTheme.disabledInactiveTickMarkColor)},
      thumbColor: ${colorToCode(sliderTheme.thumbColor)},
      disabledThumbColor: ${colorToCode(sliderTheme.disabledThumbColor)},
      thumbShape: ${instanceToCode(sliderTheme.thumbShape)},
      overlayColor: ${colorToCode(sliderTheme.overlayColor)},
      valueIndicatorColor: ${colorToCode(sliderTheme.valueIndicatorColor)},
      valueIndicatorShape: ${instanceToCode(sliderTheme.valueIndicatorShape)},
      showValueIndicator: ${sliderTheme.showValueIndicator},
      valueIndicatorTextStyle: ${textStyleToCode(sliderTheme.valueIndicatorTextStyle)},
    )''';
}

Map<String, dynamic> sliderThemeToMap(SliderThemeData sliderTheme) {
  return <String, dynamic>{
    'activeTrackColor': sliderTheme.activeTrackColor.value,
    'inactiveTrackColor': sliderTheme.inactiveTrackColor.value,
    'disabledActiveTrackColor': sliderTheme.disabledActiveTrackColor.value,
    'disabledInactiveTrackColor': sliderTheme.disabledInactiveTrackColor.value,
    'activeTickMarkColor': sliderTheme.activeTickMarkColor.value,
    'inactiveTickMarkColor': sliderTheme.inactiveTickMarkColor.value,
    'disabledActiveTickMarkColor':
        sliderTheme.disabledActiveTickMarkColor.value,
    'disabledInactiveTickMarkColor':
        sliderTheme.disabledInactiveTickMarkColor.value,
    'thumbColor': sliderTheme.thumbColor.value,
    'disabledThumbColor': sliderTheme.disabledThumbColor.value,
    'thumbShape': {'type': 'RoundSliderThumbShape'},
    'overlayColor': sliderTheme.overlayColor.value,
    'valueIndicatorColor': sliderTheme.valueIndicatorColor.value,
    'valueIndicatorShape': {'type': 'PaddleSliderValueIndicatorShape'},
    'showValueIndicator':
        ShowValueIndicator.values.indexOf(sliderTheme.showValueIndicator),
    'valueIndicatorTextStyle':
        textStyleToMap(sliderTheme.valueIndicatorTextStyle),
  };
}

SliderThemeData sliderThemeFromMap(Map<String, dynamic> data) {
  return SliderThemeData(
    activeTrackColor: Color(data['activeTrackColor']),
    inactiveTrackColor: Color(data['inactiveTrackColor']),
    disabledActiveTrackColor: Color(data['disabledActiveTrackColor']),
    disabledInactiveTrackColor: Color(data['disabledInactiveTrackColor']),
    activeTickMarkColor: Color(data['activeTickMarkColor']),
    inactiveTickMarkColor: Color(data['inactiveTickMarkColor']),
    disabledActiveTickMarkColor: Color(data['disabledActiveTickMarkColor']),
    disabledInactiveTickMarkColor: Color(data['disabledInactiveTickMarkColor']),
    thumbColor: Color(data['thumbColor']),
    disabledThumbColor: Color(data['disabledThumbColor']),
    thumbShape: RoundSliderThumbShape(),
    overlayColor: Color(data['overlayColor']),
    valueIndicatorColor: Color(data['valueIndicatorColor']),
    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
    showValueIndicator: ShowValueIndicator.values[data['showValueIndicator']],
    valueIndicatorTextStyle: textStyleFromMap(data['valueIndicatorTextStyle']),
  );
}

String instanceToCode(dynamic instance) =>
    '$instance()'.replaceAll('Instance of \'', '').replaceAll('\'', '');

String dialogThemeToCode(DialogTheme iconTheme) {
  return '''DialogTheme(
      shape: ${iconTheme.shape}
    )''';
}

/// TODO indicator Decoration
String tabBarThemeToCode(TabBarTheme tabBarTheme) {
  return '''TabBarTheme(
      indicatorSize: ${tabBarTheme.indicatorSize},
      labelColor: ${colorToCode(tabBarTheme.labelColor)},
      unselectedLabelColor: ${colorToCode(tabBarTheme.unselectedLabelColor)},
    )''';
}

String chipThemeToCode(ChipThemeData chipTheme) {
  return '''ChipThemeData(
      backgroundColor: ${colorToCode(chipTheme.backgroundColor)},
      brightness: ${chipTheme.brightness},
      deleteIconColor: ${colorToCode(chipTheme.deleteIconColor)},
      disabledColor: ${colorToCode(chipTheme.disabledColor)},
      labelPadding: ${paddingToCode(chipTheme.labelPadding)},
      labelStyle: ${textStyleToCode(chipTheme.labelStyle)},
      padding: ${paddingToCode(chipTheme.padding)},
      secondaryLabelStyle: ${textStyleToCode(chipTheme.secondaryLabelStyle)},
      secondarySelectedColor: ${colorToCode(chipTheme.secondarySelectedColor)},
      selectedColor: ${colorToCode(chipTheme.selectedColor)},
      shape: ${chipShapeToCode(chipTheme)},
    )''';
}

String chipShapeToCode(ChipThemeData chipTheme) {
  final shape = chipTheme.shape;
  if (shape is StadiumBorder) {
    return '''StadiumBorder(
      side: BorderSide(
          color: Color(0xff000000), width: 0.0, style: BorderStyle.none
      )
    )''';
  }
  return 'null';
}
