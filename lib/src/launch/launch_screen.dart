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

  bool editMode = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('LaunchScreenState.build... ');
    imageCache.clear();
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
              PanacheLogo(),
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
                  ? Column(children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FlatButton(
                          child: Text(
                            editMode ? 'Done' : 'Edit',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.blueGrey),
                          ),
                          onPressed: () => setState(() => editMode = !editMode),
                        ),
                      ),
                      Container(
                        color: Colors.blueGrey.shade200,
                        constraints: BoxConstraints.expand(height: 300),
                        child: ListView(
                          padding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 16),
                          shrinkWrap: true,
                          itemExtent: 180,
                          scrollDirection: Axis.horizontal,
                          semanticChildCount: model.themes?.length ?? 0,
                          children: _buildThemeThumbs(model.themes ?? [],
                              basePath: '${model.dir?.path ?? ''}/themes'),
                        ),
                      )
                    ])
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
                key: UniqueKey(),
                theme: f,
                removable: editMode,
                basePath: basePath,
                onThemeSelection: (PanacheTheme theme) => _loadTheme(theme),
                onDeleteTheme: (PanacheTheme theme) =>
                    widget.model.deleteTheme(theme),
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

class PanacheLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('logo.png', package: 'panache_lib', width: 60),
        ),
        Text('Panache', style: textTheme.display1),
      ],
    );
  }
}
