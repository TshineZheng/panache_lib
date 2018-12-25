import 'package:flutter/material.dart';
import 'package:flutterial_components/src/theme_model.dart';
import 'package:flutterial_components/src/utils/syntax_highlighter.dart';

class ThemeCodePreview extends StatelessWidget {
  final ThemeModel model;
  String get code => model.themeCode;

  const ThemeCodePreview(this.model, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SyntaxHighlighterStyle style =
        Theme.of(context).brightness == Brightness.dark
            ? SyntaxHighlighterStyle.darkThemeStyle()
            : SyntaxHighlighterStyle.lightThemeStyle();

    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(top: 32.0),
          child: RichText(
            text: TextSpan(
                style: const TextStyle(fontFamily: 'monospace', fontSize: 10.0),
                children: <TextSpan>[
                  DartSyntaxHighlighter(style).format(code)
                ]),
          )),
    );
  }
}
