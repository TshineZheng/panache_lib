import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterial_components/flutterial_components.dart';
import 'package:path_provider/path_provider.dart';

class ThemeService {
  ThemeData _theme;
  File _themeFile;
  VoidCallback _onThemeChanged;

  ThemeData get theme => _theme;
  set theme(ThemeData theme) {
    _theme = theme;
    _onThemeChanged();
    _saveTheme();
  }

  ThemeService(BuildContext context, VoidCallback onThemeChanged) {
    _theme = Theme.of(context);
    _onThemeChanged = onThemeChanged;
    _loadTheme();
  }

  Future _loadTheme() async {
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
    _onThemeChanged();
  }

  void _saveTheme() async {
    final map = {
      "platform": theme.platform == TargetPlatform.iOS ? 'iOS' : 'android',
      "isDark": theme.brightness == Brightness.light ? 0 : 1,
      "primaryColor": getMaterialName(theme.primaryColor),
      "accentColor": getMaterialName(theme.accentColor),
      "scaffoldBackgroundColor": getMaterialName(theme.scaffoldBackgroundColor),
      "buttonColor": getMaterialName(theme.buttonColor),
      "dividerColor": getMaterialName(theme.dividerColor),
      "canvasColor": getMaterialName(theme.canvasColor),
      "cardColor": getMaterialName(theme.cardColor),
      "disabledColor": getMaterialName(theme.disabledColor),
      "backgroundColor": getMaterialName(theme.backgroundColor),
      "highlightColor": getMaterialName(theme.highlightColor),
      "splashColor": getMaterialName(theme.splashColor),
      "dialogBackgroundColor": getMaterialName(theme.dialogBackgroundColor),
      "hintColor": getMaterialName(theme.hintColor),
      "errorColor": getMaterialName(theme.errorColor),
      "indicatorColor": getMaterialName(theme.indicatorColor),
      "selectedRowColor": getMaterialName(theme.selectedRowColor),
      "unselectedWidgetColor": getMaterialName(theme.unselectedWidgetColor),
      "secondaryHeaderColor": getMaterialName(theme.secondaryHeaderColor),
      "textSelectionColor": getMaterialName(theme.textSelectionColor),
      "textSelectionHandleColor":
          getMaterialName(theme.textSelectionHandleColor)
    };

    await _themeFile.writeAsString(json.encode(map));
  }
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
