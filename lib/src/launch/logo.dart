import 'package:flutter/material.dart';

class PanacheLogo extends StatelessWidget {
  final bool minimized;

  const PanacheLogo({Key key, this.minimized}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment:
          minimized ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(minimized ? 4 : 8),
          child: Image.asset('logo.png',
              package: 'panache_lib', width: minimized ? 16 : 48),
        ),
        Text('Panache',
            style: minimized ? textTheme.subhead : textTheme.display1),
      ],
    );
  }
}
