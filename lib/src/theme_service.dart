import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'converters/theme_converter.dart';

typedef Future<Directory> DirectoryProvider();

class ThemeService {
  Directory _dir;
  ThemeData _theme;
  ThemeData get theme => _theme;
  final Function(String, String) themeExporter;

  ThemeService({this.themeExporter, DirectoryProvider dirProvider}) {
    dirProvider().then((dir) => _dir = dir);
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
        platform:
            Platform.isAndroid ? TargetPlatform.android : TargetPlatform.iOS,
      ),
    );
  }

  void updateTheme(ThemeData newTheme) => _theme = newTheme;

  void exportTheme({String filename, String code}) =>
      themeExporter(code, filename);

  void saveTheme(String filename) async {
    final map = themeToMap(_theme);

    try {
      final _themeFile = File('${_dir.path}/themes/$filename.json');
      final jsonTheme = json.encode(map);
      print('ThemeService.saveTheme...\n${_themeFile.path}\n$jsonTheme');
      await _themeFile.create(recursive: true);
      await _themeFile.writeAsString(jsonTheme, flush: true);
    } catch (error) {
      print('ThemeService.saveTheme... $error');
    }
  }

  Future<ThemeData> loadTheme(String path) async {
    final _themeFile = File('${_dir.path}/themes/$path');

    if (!(await _themeFile.exists())) {
      throw Exception('ERROR : Theme file not founded !');
    }

    final jsonTheme = await _themeFile.readAsString();
    _theme = themeFromJson(jsonTheme);
    return _theme;
  }
}
