import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'converters/theme_converter.dart';

typedef Future<Directory> DirectoryProvider();

class ThemeService {
  final Function(String, String) themeExporter;

  final DirectoryProvider dirProvider;
  Directory _dir;
  Directory get dir => _dir;

  ThemeData _theme;
  ThemeData get theme => _theme;

  List<File> _themes;
  List<File> get themes => _themes;

  VoidCallback _onChange;

  ThemeService({this.themeExporter, this.dirProvider});

  init(VoidCallback onChange) {
    _onChange = onChange;
    dirProvider().then((dir) async {
      _dir = dir;
      _onChange();
    });
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
      print('ThemeService.saveTheme...\n${_themeFile.path}');
      final jsonTheme = json.encode(map);
      await _themeFile.create(recursive: true);
      await _themeFile.writeAsString(jsonTheme, flush: true);
      _onChange();
    } catch (error) {
      throw Exception('Error : The theme can\'t be saved. $error');
    }
  }

  void screenshot(String filename, Uint8List pngBytes) async {
    final screenshotName = '$filename.png';
    final screenshotFile = File('${_dir.path}/themes/$screenshotName');
    await screenshotFile.create(recursive: true);
    await screenshotFile.writeAsBytes(pngBytes);
    print('ThemeService.screenshot => $screenshotFile');
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
