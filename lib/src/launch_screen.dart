import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  @override
  LaunchScreenState createState() {
    return new LaunchScreenState();
  }
}

class LaunchScreenState extends State<LaunchScreen> {
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
