import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:quiver/time.dart';
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

  final CloudService _cloudService;

  final List<PanacheTheme> _themes;

  final LocalData localData;

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

  List<PanacheTheme> get themes => _themes;

  String get uuid => _uuid.generateV4();

  ThemeModel({
    @required CloudService cloudService,
    @required ThemeService service,
    @required this.localData,
  })  : _service = service,
        _cloudService = cloudService,
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
    //_service.saveTheme(uuid);
    localData.updateThemeList(_themes);

    notifyListeners();
  }

  onChange() {
    notifyListeners();
  }

  void updateTheme(ThemeData updatedTheme) {
    _service.updateTheme(updatedTheme);
    saveTheme();
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
    _currentTheme = theme;
    final result = await _service.loadTheme('${theme.id}.json');
    notifyListeners();
    return result;
  }

  void initScreenshooter(ScreenShooter screenShooterKey) {
    _screenShooter = screenShooterKey;
    Future.delayed(aSecond, () => saveTheme());
  }

  Future<bool> exportThemeToDrive() async {
    if (!_cloudService.authenticated) await _cloudService.login();

    final result = await _cloudService.save(themeToCode(_service.theme));
    print('ThemeModel.exportThemeToDrive... $result');
    return result != null;
  }

  deleteTheme(PanacheTheme theme) async {
    localData.deleteTheme(theme);
    _themes.remove(theme);
    await File('${dir.path}/themes/${theme.id}.png').delete();
    await File('${dir.path}/themes/${theme.id}.json').delete();
    notifyListeners();
  }
}

abstract class CloudService {
  bool get authenticated => null;

  login();
  logout();
  Future save(String content);
}
