import 'package:flutter/material.dart';

class TypographyPreview extends StatelessWidget {
  final ThemeData theme;

  const TypographyPreview({Key key, this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Text(
            'Headline',
            style: theme.textTheme.headline,
          ),
          Text(
            'Subhead',
            style: theme.textTheme.subhead,
          ),
          Text(
            'Title',
            style: theme.textTheme.title,
          ),
          Text(
            'Subtitle',
            style: theme.textTheme.subtitle,
          ),
          Text(
            'Caption',
            style: theme.textTheme.caption,
          ),
          Text(
            'Overline',
            style: theme.textTheme.overline,
          ),
          Text(
            'Body 1',
            style: theme.textTheme.body1,
          ),
          Text(
            'Body 2',
            style: theme.textTheme.body2,
          ),
          FlatButton(
              child: Text(
                'button',
                style: theme.textTheme.button,
              ),
              onPressed: () {}),
          Text(
            'Display 1',
            style: theme.textTheme.display1,
          ),
          Text(
            'Display 2',
            style: theme.textTheme.display2,
          ),
          Text(
            'Display 3',
            style: theme.textTheme.display3,
          ),
          Text(
            'Display 4',
            style: theme.textTheme.display4,
          ),
        ],
      ),
    );
    ;
  }
}
