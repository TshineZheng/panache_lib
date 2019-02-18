import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'models.dart';

const _themeKey = 'themes';
const _panelsKey = 'panelsState';
const _positionKey = 'scrollPosition';

class LocalData {
  SharedPreferences _prefs;

  List<PanacheTheme> get themes =>
      _prefs
          .getStringList(_themeKey)
          ?.map<PanacheTheme>(themeDataFromJson)
          ?.toList() ??
      <PanacheTheme>[];

  Map<String, dynamic> get panelStates {
    final states = _prefs.getString(_panelsKey);
    if (states == null)
      return {
        'colorPanelExpanded': false,
        'buttonThemePanelExpanded': false,
        'iconThemePanelExpanded': false,
        'sliderThemePanelExpanded': false,
        'tabBarThemePanelExpanded': false,
        'chipThemePanelExpanded': false,
        'dialogThemePanelExpanded': false,
        'textPanelExpanded': false,
        'primaryTextPanelExpanded': false,
        'accentTextPanelExpanded': false,
        'inputsPanelExpanded': false,
      };
    return json.decode(states);
  }

  double get scrollPosition => _prefs.getDouble(_positionKey);

  init() async => _prefs = await SharedPreferences.getInstance();

  updateThemeList(List<PanacheTheme> themes) => _prefs.setStringList(
        _themeKey,
        themes.map((theme) => theme.toJson()).toList(growable: false),
      );

  PanacheTheme themeDataFromJson(String data) => PanacheTheme.fromJson(data);

  void clear() => _prefs.remove(_themeKey);

  void deleteTheme(PanacheTheme theme) {
    updateThemeList(themes.where((t) => t.id != theme.id).toList());
  }

  saveEditorState(Map<String, bool> panelStates, double pixels) {
    _prefs.setString(_panelsKey, json.encode(panelStates));
    _prefs.setDouble(_positionKey, pixels);
  }

  saveScrollPosition(double pixels) {
    _prefs.setDouble(_positionKey, pixels);
  }
}
