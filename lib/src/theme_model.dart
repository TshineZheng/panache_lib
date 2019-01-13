import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:panache_lib/src/services/theme_service.dart';
import 'package:quiver/time.dart';
import 'package:scoped_model/scoped_model.dart';

import 'converters/theme_converter.dart';
import 'local_data.dart';
import 'models.dart';
import 'services/cloud_service.dart';
import 'utils/uuid.dart';

typedef Future<Uint8List> ScreenShooter();

class ThemeModel extends Model {
  static ThemeModel of(BuildContext context) =>
      ScopedModel.of<ThemeModel>(context);

  final CloudService _cloudService;

  final List<PanacheTheme> _themes;

  final Uuid _uuid = Uuid();

  ThemeService _service;

  PanacheTheme _currentTheme;

  ScreenShooter _screenShooter;

  final LocalData localData;

  ThemeData get theme => _service.theme;

  MaterialColor get primarySwatch => _currentTheme.primarySwatch;

  Directory get dir => _service.dir;

  String get themeCode => themeToCode(theme);

  List<PanacheTheme> get themes => _themes;

  String get uuid => _uuid.generateV4();

  User _currentUser;
  User get user => _currentUser;

  ThemeModel({
    @required CloudService cloudService,
    @required ThemeService service,
    @required this.localData,
  })  : _service = service,
        _cloudService = cloudService,
        _themes = localData.themes {
    _service.init(onChange);
    _cloudService.currentUser$.listen((user) {
      _currentUser = user;
      notifyListeners();
    });
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

    _service.initTheme(primarySwatch: primarySwatch, brightness: brightness);

    _themes.add(_currentTheme);
    localData.updateThemeList(_themes);

    notifyListeners();
  }

  onChange() => notifyListeners();

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
    if (pngBytes == null || pngBytes.length == 0) return;

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
    Future.delayed(aSecond * 2, () => saveTheme());
  }

  Future<dynamic> exportThemeToDrive() async {
    bool authenticated = await _cloudService.authenticated;
    if (!authenticated) authenticated = await _cloudService.login();

    if (!authenticated) return false;
    final result = await _cloudService.save(themeToCode(_service.theme));
    print('ThemeModel.exportThemeToDrive... $result');
    return result.originalFilename ?? result.name;
  }

  deleteTheme(PanacheTheme theme) async {
    localData.deleteTheme(theme);
    _themes.remove(theme);
    final screenshot = File('${dir.path}/themes/${theme.id}.png');
    if (await screenshot.exists()) await screenshot.delete();

    final dataFile = File('${dir.path}/themes/${theme.id}.json');
    if (await dataFile.exists()) await dataFile.delete();

    notifyListeners();
  }

  Future<bool> login() async {
    final result = await _cloudService.login();
    notifyListeners();
    return result;
  }

  void logout() async {
    await _cloudService.logout();
    notifyListeners();
  }
}
