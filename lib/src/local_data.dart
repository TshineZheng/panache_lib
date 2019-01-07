import 'package:shared_preferences/shared_preferences.dart';

import 'models.dart';

const _themeKey = 'themes';

class LocalData {
  SharedPreferences _prefs;

  List<PanacheTheme> get themes =>
      _prefs
          .getStringList(_themeKey)
          ?.map<PanacheTheme>(themeDataFromJson)
          ?.toList() ??
      <PanacheTheme>[];

  init() async => _prefs = await SharedPreferences.getInstance();

  updateThemeList(List<PanacheTheme> themes) => _prefs.setStringList(
        _themeKey,
        themes.map((theme) => theme.toJson()).toList(growable: false),
      );

  PanacheTheme themeDataFromJson(String data) => PanacheTheme.fromJson(data);

  void clear() => _prefs.remove(_themeKey);
}
