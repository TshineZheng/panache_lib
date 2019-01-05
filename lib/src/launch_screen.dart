import 'dart:io';

import 'package:flutter/material.dart';
import 'package:panache_lib/src/theme_model.dart';

class LaunchScreen extends StatefulWidget {
  final Directory dir;
  final ThemeModel model;

  const LaunchScreen({Key key, this.dir, this.model}) : super(key: key);

  @override
  LaunchScreenState createState() {
    return new LaunchScreenState();
  }
}

class LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(child: Text('New theme'), onPressed: _openEditor),
          RaisedButton(child: Text('Load theme'), onPressed: _loadTheme),
        ],
      )),
    );
  }

  _openEditor() => Navigator.of(context).pushNamed('/editor');
  Future _loadTheme() async {
    await widget.model.loadTheme('new_theme');
    return _openEditor();
  }
}
