import 'dart:io';

import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  final Directory dir;

  const LaunchScreen({Key key, this.dir}) : super(key: key);

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
          child: Container(
              child: RaisedButton(
                  child: Text('New theme'), onPressed: () => _newTheme()))),
    );
  }

  _newTheme() => Navigator.of(context).pushNamed('/editor');
}
