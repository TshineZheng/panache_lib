import 'package:flutter/material.dart';

class TypographyPreview extends StatelessWidget {
  //final ThemeData theme;

  final TextTheme textTheme;
  final Brightness brightness;

  const TypographyPreview(
      {Key key, @required this.textTheme, @required this.brightness})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: brightness == Brightness.dark
          ? Colors.grey.shade700
          : Colors.grey.shade100,
      padding: EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Text(
            'Headline',
            style: textTheme.headline,
          ),
          Text(
            'Subhead',
            style: textTheme.subhead,
          ),
          Text(
            'Title',
            style: textTheme.title,
          ),
          Text(
            'Subtitle',
            style: textTheme.subtitle,
          ),
          Text(
            'Caption',
            style: textTheme.caption,
          ),
          Text(
            'Overline',
            style: textTheme.overline,
          ),
          Text(
            'Body 1',
            style: textTheme.body1,
          ),
          Text(
            'Body 2',
            style: textTheme.body2,
          ),
          FlatButton(
              child: Text(
                'button',
                style: textTheme.button,
              ),
              onPressed: () {}),
          Text(
            'Display 1',
            style: textTheme.display1,
          ),
          Text(
            'Display 2',
            style: textTheme.display2,
          ),
          Text(
            'Display 3',
            style: textTheme.display3,
          ),
          Text(
            'Display 4',
            style: textTheme.display4,
          ),
        ],
      ),
    );
  }
}
