import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models.dart';
import '../theme_model.dart';
import 'new_theme_panel.dart';
import 'screenshot_renderer.dart';

class LaunchScreen extends StatefulWidget {
  final ThemeModel model;

  const LaunchScreen({Key key, this.model}) : super(key: key);

  @override
  LaunchScreenState createState() {
    return new LaunchScreenState();
  }
}

class LaunchScreenState extends State<LaunchScreen> {
  ColorSwatch newThemePrimary = Colors.blue;

  Brightness initialBrightness = Brightness.light;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      body: SafeArea(child: ScopedModelDescendant<ThemeModel>(
          builder: (BuildContext context, Widget child, ThemeModel model) {
        return ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Panache',
                style: textTheme.display1,
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 520),
                child: NewThemePanel(
                    newThemePrimary: newThemePrimary,
                    initialBrightness: initialBrightness,
                    onSwatchSelection: onSwatchSelection,
                    onBrightnessSelection: onBrightnessSelection,
                    onNewTheme: () => _newTheme(model)),
              ),
              model.themes?.isNotEmpty ?? false
                  ? Container(
                      color: Colors.blueGrey.shade200,
                      padding: EdgeInsets.symmetric(vertical: 18.0),
                      constraints: BoxConstraints.expand(height: 280),
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        semanticChildCount: model.themes?.length ?? 0,
                        children: _buildThemeThumbs(model.themes ?? [],
                            basePath: '${model.dir?.path ?? ''}/themes'),
                      ),
                    )
                  : SizedBox()
            ],
          ),
        );
      })),
    );
  }

  void onSwatchSelection(ColorSwatch value) =>
      setState(() => newThemePrimary = value);

  void onBrightnessSelection(Brightness value) =>
      setState(() => initialBrightness = value);

  List<Widget> _buildThemeThumbs(
    List<PanacheTheme> themes, {
    String basePath,
  }) =>
      themes
          .map<Widget>((f) => ScreenshotRenderer(
                theme: f,
                basePath: basePath,
                onThemeSelection: (PanacheTheme theme) => _loadTheme(theme),
              ))
          .toList();

  _newTheme(ThemeModel model) {
    model.newTheme(
        primarySwatch: newThemePrimary, brightness: initialBrightness);
    _editTheme();
  }

  _editTheme() => Navigator.of(context).pushNamed('/editor');

  Future _loadTheme(PanacheTheme theme) async {
    await widget.model.loadTheme(theme);
    return _editTheme();
  }
}
