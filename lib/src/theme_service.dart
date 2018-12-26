import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef Future<Directory> DirectoryProvider();

class ThemeService {
  ThemeData _theme;
  ThemeData get theme => _theme;
  final Function(String, String) themeExporter;

  ThemeService({this.themeExporter}) {
    initTheme();
  }

  ThemeData _localize(ThemeData theme) =>
      ThemeData.localize(theme, Typography.englishLike2018);

  void initTheme(
      {MaterialColor primarySwatch: Colors.blue,
      Brightness brightness: Brightness.light}) {
    _theme = _localize(
      ThemeData(
          primarySwatch: primarySwatch,
          brightness: brightness,
          platform: TargetPlatform.iOS),
    );
  }

  void updateTheme(ThemeData newTheme) => _theme = newTheme;

  void exportTheme({String filename, String code}) =>
      themeExporter(code, filename);

  /*Future _loadTheme() async {
    var dir = await getApplicationDocumentsDirectory();
    _themeFile = File(dir.path + '/theme.json');

    if (!(await _themeFile.exists())) {
      await _themeFile
          .writeAsString(await rootBundle.loadString("assets/theme.json"));
    }

    final jsonTheme = await _themeFile.readAsString();
    final themeMap = json.decode(jsonTheme);
    _theme = _theme.copyWith(
        primaryColor: getMaterialColor(themeMap['primaryColor'].toString()),
        accentColor: getMaterialColor(themeMap['accentColor'].toString()),
        scaffoldBackgroundColor:
            getMaterialColor(themeMap['scaffoldBackgroundColor'].toString()),
        buttonColor: getMaterialColor(themeMap['buttonColor'].toString()),
        dividerColor: getMaterialColor(themeMap['dividerColor'].toString()),
        canvasColor: getMaterialColor(themeMap['canvasColor'].toString()),
        cardColor: getMaterialColor(themeMap['cardColor'].toString()),
        disabledColor: getMaterialColor(themeMap['disabledColor'].toString()),
        backgroundColor:
            getMaterialColor(themeMap['backgroundColor'].toString()),
        highlightColor: getMaterialColor(themeMap['highlightColor'].toString()),
        splashColor: getMaterialColor(themeMap['splashColor'].toString()),
        dialogBackgroundColor:
            getMaterialColor(themeMap['dialogBackgroundColor'].toString()),
        hintColor: getMaterialColor(themeMap['hintColor'].toString()),
        errorColor: getMaterialColor(themeMap['errorColor'].toString()),
        indicatorColor: getMaterialColor(themeMap['indicatorColor'].toString()),
        selectedRowColor:
            getMaterialColor(themeMap['selectedRowColor'].toString()),
        unselectedWidgetColor:
            getMaterialColor(themeMap['unselectedWidgetColor'].toString()),
        secondaryHeaderColor:
            getMaterialColor(themeMap['secondaryHeaderColor'].toString()),
        textSelectionColor:
            getMaterialColor(themeMap['textSelectionColor'].toString()),
        textSelectionHandleColor:
            getMaterialColor(themeMap['textSelectionHandleColor'].toString()),
        platform: themeMap['textSelectionHandleColor'].toString() == "ios"
            ? TargetPlatform.iOS
            : TargetPlatform.android,
        brightness:
            themeMap['isDark'] == 1 ? Brightness.dark : Brightness.light);

    // set _theme and call _onThemeChanged directly to avoid saving the theme we just loaded
  }

  void _saveTheme() async {
    final map = {
      "platform": _theme.platform == TargetPlatform.iOS ? 'iOS' : 'android',
      "isDark": _theme.brightness == Brightness.light ? 0 : 1,
      "primaryColor": getMaterialName(_theme.primaryColor),
      "accentColor": getMaterialName(_theme.accentColor),
      "scaffoldBackgroundColor":
          getMaterialName(_theme.scaffoldBackgroundColor),
      "buttonColor": getMaterialName(_theme.buttonColor),
      "dividerColor": getMaterialName(_theme.dividerColor),
      "canvasColor": getMaterialName(_theme.canvasColor),
      "cardColor": getMaterialName(_theme.cardColor),
      "disabledColor": getMaterialName(_theme.disabledColor),
      "backgroundColor": getMaterialName(_theme.backgroundColor),
      "highlightColor": getMaterialName(_theme.highlightColor),
      "splashColor": getMaterialName(_theme.splashColor),
      "dialogBackgroundColor": getMaterialName(_theme.dialogBackgroundColor),
      "hintColor": getMaterialName(_theme.hintColor),
      "errorColor": getMaterialName(_theme.errorColor),
      "indicatorColor": getMaterialName(_theme.indicatorColor),
      "selectedRowColor": getMaterialName(_theme.selectedRowColor),
      "unselectedWidgetColor": getMaterialName(_theme.unselectedWidgetColor),
      "secondaryHeaderColor": getMaterialName(_theme.secondaryHeaderColor),
      "textSelectionColor": getMaterialName(_theme.textSelectionColor),
      "textSelectionHandleColor":
          getMaterialName(_theme.textSelectionHandleColor)
    };

    await _themeFile.writeAsString(json.encode(map));
  }

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
  */

}
