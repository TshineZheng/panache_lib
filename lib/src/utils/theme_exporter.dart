import 'package:flutter/material.dart';

import 'color_utils.dart';

String themeToCode(ThemeData theme) {
  return '''
  import 'package:flutter/material.dart';
  
  final ThemeData myTheme = ThemeData(
    primarySwatch: ${swatchConstructorFor(color: theme.primaryColor)},
    brightness: ${theme.brightness},
    primaryColor: ${colorToCode(theme.primaryColor)},
    primaryColorBrightness: ${theme.primaryColorBrightness},
    primaryColorLight: ${theme.primaryColorLight},
    primaryColorDark: ${theme.primaryColorDark},
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
    buttonTheme: ${buttonThemeToCode(theme.buttonTheme)},
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
    FIX
    inputDecorationTheme: ${theme.inputDecorationTheme},
    colorScheme: ${theme.colorScheme},
    splashFactory: ${theme.splashFactory},
    materialTapTargetSize: ${theme.materialTapTargetSize},
    pageTransitionsTheme: ${theme.pageTransitionsTheme},
    platform: ${theme.platform},
 */

String buttonThemeToCode(ButtonThemeData buttonTheme) {
  return '''ButtonThemeData(
      textTheme: ${buttonTheme.textTheme},
      minWidth: ${buttonTheme.minWidth},
      height: ${buttonTheme.height},
      padding: ${paddingToCode(buttonTheme.padding)},
    )''';
}

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

String paddingToCode(EdgeInsets padding) {
  return 'EdgeInsets.only(top:${padding.top},bottom:${padding.bottom},left:${padding.left}, right:${padding.right})';
}

String instanceToCode(dynamic instance) =>
    '$instance()'.replaceAll('Instance of \'', '').replaceAll('\'', '');

String dialogThemeToCode(DialogTheme iconTheme) {
  return '''DialogTheme(
      shape: ${iconTheme.shape}
    )''';
}

String iconThemeToCode(IconThemeData iconTheme) {
  return '''IconThemeData(
      color: ${colorToCode(iconTheme.color)},
      opacity: ${iconTheme.opacity},
      size: ${iconTheme.size},
    )''';
}

String colorToCode(Color color) {
  if (color == null) return 'null';
  return 'Color( 0x${color.value.toRadixString(16).padLeft(8, '0')} )';
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

String textStyleToCode(TextStyle style) {
  return '''TextStyle(
      color: ${colorToCode(style.color)},
      fontSize: ${style.fontSize},
      fontWeight: ${style.fontWeight},
      fontStyle: ${style.fontStyle},
      letterSpacing: ${style.letterSpacing},
      wordSpacing: ${style.wordSpacing},
      textBaseline: ${style.textBaseline},
      height: ${style.height},
      locale: ${style.locale},
      foreground: ${style.foreground},
      background: ${style.background},
      shadows: ${style.shadows},
      decoration: ${style.decoration},
      decorationColor: ${colorToCode(style.decorationColor)},
      decorationStyle: ${style.decorationStyle},
    )''';
}

String textThemeToCode(TextTheme textTheme) {
  return '''TextTheme(
      display4: ${textStyleToCode(textTheme.display4)},
      display3: ${textStyleToCode(textTheme.display3)},
      display2: ${textStyleToCode(textTheme.display2)},
      display1: ${textStyleToCode(textTheme.display1)},
      headline: ${textStyleToCode(textTheme.headline)},
      title: ${textStyleToCode(textTheme.title)},
      subhead: ${textStyleToCode(textTheme.subhead)},
      body2: ${textStyleToCode(textTheme.body2)},
      body1: ${textStyleToCode(textTheme.body1)},
      caption: ${textStyleToCode(textTheme.caption)},
      button: ${textStyleToCode(textTheme.button)},
      subtitle: ${textStyleToCode(textTheme.subtitle)},
      overline: ${textStyleToCode(textTheme.overline)},
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
