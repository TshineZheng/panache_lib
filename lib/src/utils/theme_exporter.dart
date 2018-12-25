import 'package:flutter/material.dart';
import 'package:flutterial_components/src/utils/color_utils.dart';

String themeToCode(ThemeData theme) {
  return '''
  import 'package:flutter/material.dart';
  
  final ThemeData myTheme = ThemeData(
    primarySwatch: ${swatchConstructorFor(color: theme.primaryColor)},
    brightness: ${theme.brightness},
    primaryColor: Color(${theme.primaryColor.value}),
    primaryColorBrightness: ${theme.primaryColorBrightness},
    primaryColorLight: ${theme.primaryColorLight},
    primaryColorDark: ${theme.primaryColorDark},
    accentColor: ${theme.accentColor},
    accentColorBrightness: ${theme.accentColorBrightness},
    canvasColor: ${theme.canvasColor},
    scaffoldBackgroundColor: ${theme.scaffoldBackgroundColor},
    bottomAppBarColor: ${theme.bottomAppBarColor},
    cardColor: ${theme.cardColor},
    dividerColor: ${theme.dividerColor},
    highlightColor: ${theme.highlightColor},
    splashColor: ${theme.splashColor},
    selectedRowColor: ${theme.selectedRowColor},
    unselectedWidgetColor: ${theme.unselectedWidgetColor},
    disabledColor: ${theme.disabledColor},
    buttonTheme: ${buttonThemeToCode(theme.buttonTheme)},
    buttonColor: ${theme.buttonColor},
    toggleableActiveColor: ${theme.toggleableActiveColor},
    secondaryHeaderColor: ${theme.secondaryHeaderColor},
    textSelectionColor: ${theme.textSelectionColor},
    cursorColor: ${theme.cursorColor},
    textSelectionHandleColor: ${theme.textSelectionHandleColor},
    backgroundColor: ${theme.backgroundColor},
    dialogBackgroundColor: ${theme.dialogBackgroundColor},
    indicatorColor: ${theme.indicatorColor},
    hintColor: ${theme.hintColor},
    errorColor: ${theme.errorColor},
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
      activeTrackColor: ${sliderTheme.activeTrackColor},
      inactiveTrackColor: ${sliderTheme.inactiveTrackColor},
      disabledActiveTrackColor: ${sliderTheme.disabledActiveTrackColor},
      disabledInactiveTrackColor: ${sliderTheme.disabledInactiveTrackColor},
      activeTickMarkColor: ${sliderTheme.activeTickMarkColor},
      inactiveTickMarkColor: ${sliderTheme.inactiveTickMarkColor},
      disabledActiveTickMarkColor: ${sliderTheme.disabledActiveTickMarkColor},
      disabledInactiveTickMarkColor: ${sliderTheme.disabledInactiveTickMarkColor},
      thumbColor: ${sliderTheme.thumbColor},
      disabledThumbColor: ${sliderTheme.disabledThumbColor},
      thumbShape: ${instanceToCode(sliderTheme.thumbShape)},
      overlayColor: ${sliderTheme.overlayColor},
      valueIndicatorColor: ${sliderTheme.valueIndicatorColor},
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
      color: ${iconTheme.color},
      opacity: ${iconTheme.opacity},
      size: ${iconTheme.size},
    )''';
}

/// TODO indicator Decoration
String tabBarThemeToCode(TabBarTheme tabBarTheme) {
  return '''TabBarTheme(
      indicatorSize: ${tabBarTheme.indicatorSize},
      labelColor: ${tabBarTheme.labelColor},
      unselectedLabelColor: ${tabBarTheme.unselectedLabelColor},
    )''';
}

String chipThemeToCode(ChipThemeData chipTheme) {
  return '''ChipThemeData(
      backgroundColor: ${chipTheme.backgroundColor},
      brightness: ${chipTheme.brightness},
      deleteIconColor: ${chipTheme.deleteIconColor},
      disabledColor: ${chipTheme.disabledColor},
      labelPadding: ${paddingToCode(chipTheme.labelPadding)},
      labelStyle: ${textStyleToCode(chipTheme.labelStyle)},
      padding: ${paddingToCode(chipTheme.padding)},
      secondaryLabelStyle: ${textStyleToCode(chipTheme.secondaryLabelStyle)},
      secondarySelectedColor: ${chipTheme.secondarySelectedColor},
      selectedColor: ${chipTheme.selectedColor},
      shape: ${chipShapeToCode(chipTheme)},
    )''';
}

String textStyleToCode(TextStyle style) {
  return '''TextStyle(
      color: ${style.color},
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
      decorationColor: ${style.decorationColor},
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
