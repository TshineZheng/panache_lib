import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

import 'converters/theme_converter.dart';
import 'local_data.dart';
import 'models.dart';
import 'theme_service.dart';
import 'utils/uuid.dart';

typedef Future<Uint8List> ScreenShooter();

class ThemeModel extends Model {
  static ThemeModel of(BuildContext context) =>
      ScopedModel.of<ThemeModel>(context);

  ThemeService _service;

  PanacheTheme _currentTheme;

  MaterialColor _primarySwatch = Colors.blue;

  String _themeName;

  ScreenShooter _screenShooter;

  ThemeData get theme => _service.theme;

  MaterialColor get primarySwatch => _primarySwatch;

  Directory get dir => _service.dir;

  String get themeCode => themeToCode(theme);

  Uuid _uuid = Uuid();

  final List<PanacheTheme> _themes;

  List<PanacheTheme> get themes => _themes;

  String get uuid => _uuid.generateV4();

  final LocalData localData;

  ThemeModel({@required ThemeService service, @required this.localData})
      : _service = service,
        _themes = localData.themes {
    _service.init(onChange);
  }

  void newTheme({
    @required MaterialColor primarySwatch,
    Brightness brightness: Brightness.light,
  }) {
    assert(primarySwatch != null);
    final defaultThemeName = 'new-theme';
    _currentTheme = PanacheTheme(
        id: uuid,
        name: defaultThemeName,
        primarySwatch: primarySwatch,
        brightness: brightness);

    _primarySwatch = primarySwatch;
    _service.initTheme(primarySwatch: primarySwatch, brightness: brightness);

    _themes.add(_currentTheme);
    _service.saveTheme(defaultThemeName);
    localData.updateThemeList(_themes);

    notifyListeners();
  }

  onChange() {
    notifyListeners();
  }

  void updateTheme(ThemeData updatedTheme) {
    _service.updateTheme(updatedTheme);
    notifyListeners();
  }

  void exportTheme({String name: 'theme'}) {
    final code = themeToCode(theme);
    _service.exportTheme(filename: name, code: code);
  }

  void updateColor({String property, Color color}) {
    final args = <Symbol, dynamic>{};
    args[Symbol(property)] = color;
    final updatedTheme = Function.apply(theme.copyWith, null, args);
    updateTheme(updatedTheme);
  }

  void saveTheme() async {
    final filename = _currentTheme.id;
    final pngBytes = await _screenShooter();

    _service.screenshot(filename, pngBytes);
    _service.saveTheme(filename);
  }

  Future loadTheme(PanacheTheme theme) async {
    final result = await _service.loadTheme('${theme.id}.json');
    notifyListeners();
    return result;
  }

  void screenshot(Uint8List pngBytes) {
    _service.screenshot(_themeName, pngBytes);
  }

  void initScreenshooter(ScreenShooter screenShooterKey) {
    _screenShooter = screenShooterKey;
  }
}
