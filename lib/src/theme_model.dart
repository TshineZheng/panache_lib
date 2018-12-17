import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

import 'theme_service.dart';

class ThemeModel extends Model {
  ThemeService _service;

  ThemeData get theme => _service.theme;

  ThemeModel({ThemeService service}) : _service = service;

  static ThemeModel of(BuildContext context) =>
      ScopedModel.of<ThemeModel>(context);

  void initTheme(
      {@required MaterialColor primarySwatch,
      Brightness brightness: Brightness.light}) {
    assert(primarySwatch != null);

    _service.initTheme(primarySwatch: primarySwatch, brightness: brightness);
    notifyListeners();
  }

  void updateTheme(ThemeData updatedTheme) {
    _service.updateTheme(updatedTheme);
    notifyListeners();
  }

  void updateColor({String property, Color color}) {
    final args = <Symbol, dynamic>{};
    args[Symbol(property)] = color;
    final updatedTheme = Function.apply(theme.copyWith, null, args);
    print('ThemeModel.updateColor... $args');
    updateTheme(updatedTheme);
  }
}
