import 'package:flutter/material.dart';

import '../../theme_model.dart';
import '../../utils/constants.dart';
import '../controls/text_style_control.dart';

class TypographyThemePanel extends StatelessWidget {
  final TextTheme txtTheme;
  final String themeRef;
  final ThemeModel model;

  const TypographyThemePanel({
    Key key,
    @required this.txtTheme,
    @required this.themeRef,
    @required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final model = ThemeModel.of(context);
    return Container(
      color: Colors.grey.shade200,
      padding: kPadding,
      child: Column(
        children: _buildTextThemeEditorFields(model),
      ),
    );
  }

  List<Widget> _buildTextThemeEditorFields(ThemeModel model) {
    final theme = model.theme;
    final headline = txtTheme.headline;
    final title = txtTheme.title;
    final subhead = txtTheme.subhead;
    final subtitle = txtTheme.subtitle;
    final body1 = txtTheme.body1;
    final body2 = txtTheme.body2;
    final caption = txtTheme.caption;
    final overline = txtTheme.overline;
    final button = txtTheme.button;
    final display1 = txtTheme.display1;
    final display2 = txtTheme.display2;
    final display3 = txtTheme.display3;
    final display4 = txtTheme.display4;

    final args = <Symbol, dynamic>{};
    return [
      TextStyleControl(
        'Headline',
        color: headline.color,
        fontSize: headline.fontSize,
        isBold: headline.fontWeight == FontWeight.bold,
        isItalic: headline.fontStyle == FontStyle.italic,
        onColorChanged: (c) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(headline: headline.copyWith(color: c));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onSizeChanged: (s) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(headline: headline.copyWith(fontSize: s));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onWeightChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              headline: headline.copyWith(
                  fontWeight: v ? FontWeight.bold : FontWeight.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onFontStyleChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              headline: headline.copyWith(
                  fontStyle: v ? FontStyle.italic : FontStyle.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
      ),
      TextStyleControl(
        'Title',
        color: title.color,
        fontSize: title.fontSize,
        isBold: title.fontWeight == FontWeight.bold,
        isItalic: title.fontStyle == FontStyle.italic,
        onColorChanged: (c) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(title: title.copyWith(color: c));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onSizeChanged: (s) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(title: title.copyWith(fontSize: s));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onWeightChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              title: title.copyWith(
                  fontWeight: v ? FontWeight.bold : FontWeight.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onFontStyleChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              title: title.copyWith(
                  fontStyle: v ? FontStyle.italic : FontStyle.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
      ),
      TextStyleControl(
        'Subhead',
        color: subhead.color,
        fontSize: subhead.fontSize,
        isBold: subhead.fontWeight == FontWeight.bold,
        isItalic: subhead.fontStyle == FontStyle.italic,
        onColorChanged: (c) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(subhead: subhead.copyWith(color: c));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onSizeChanged: (s) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(subhead: subhead.copyWith(fontSize: s));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onWeightChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              subhead: subhead.copyWith(
                  fontWeight: v ? FontWeight.bold : FontWeight.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onFontStyleChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              subhead: subhead.copyWith(
                  fontStyle: v ? FontStyle.italic : FontStyle.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
      ),
      TextStyleControl(
        'Subtitle',
        color: subtitle.color,
        fontSize: subtitle.fontSize,
        isBold: subtitle.fontWeight == FontWeight.bold,
        isItalic: subtitle.fontStyle == FontStyle.italic,
        onColorChanged: (c) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(subtitle: subtitle.copyWith(color: c));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onSizeChanged: (s) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(subtitle: subtitle.copyWith(fontSize: s));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onWeightChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              subtitle: subtitle.copyWith(
                  fontWeight: v ? FontWeight.bold : FontWeight.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onFontStyleChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              subtitle: subtitle.copyWith(
                  fontStyle: v ? FontStyle.italic : FontStyle.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
      ),
      TextStyleControl(
        'Body 1',
        color: body1.color,
        fontSize: body1.fontSize ?? 24,
        isBold: body1.fontWeight == FontWeight.bold,
        isItalic: body1.fontStyle == FontStyle.italic,
        onColorChanged: (c) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(body1: body1.copyWith(color: c));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onSizeChanged: (s) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(body1: body1.copyWith(fontSize: s));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onWeightChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              body1: body1.copyWith(
                  fontWeight: v ? FontWeight.bold : FontWeight.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onFontStyleChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              body1: body1.copyWith(
                  fontStyle: v ? FontStyle.italic : FontStyle.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
      ),
      TextStyleControl(
        'Body 2',
        color: body2.color,
        fontSize: body2.fontSize,
        isBold: body2.fontWeight == FontWeight.bold,
        isItalic: body2.fontStyle == FontStyle.italic,
        onColorChanged: (c) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(body2: body2.copyWith(color: c));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onSizeChanged: (s) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(body2: body2.copyWith(fontSize: s));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onWeightChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              body2: body2.copyWith(
                  fontWeight: v ? FontWeight.bold : FontWeight.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onFontStyleChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              body2: body2.copyWith(
                  fontStyle: v ? FontStyle.italic : FontStyle.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
      ),
      TextStyleControl(
        'Button',
        color: button.color,
        fontSize: button.fontSize,
        isBold: button.fontWeight == FontWeight.bold,
        isItalic: button.fontStyle == FontStyle.italic,
        onColorChanged: (c) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(button: button.copyWith(color: c));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onSizeChanged: (s) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(button: button.copyWith(fontSize: s));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onWeightChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              button: button.copyWith(
                  fontWeight: v ? FontWeight.bold : FontWeight.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onFontStyleChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              button: button.copyWith(
                  fontStyle: v ? FontStyle.italic : FontStyle.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
      ),
      TextStyleControl(
        'Caption',
        color: caption.color,
        fontSize: caption.fontSize,
        isBold: caption.fontWeight == FontWeight.bold,
        isItalic: caption.fontStyle == FontStyle.italic,
        onColorChanged: (c) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(caption: caption.copyWith(color: c));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onSizeChanged: (s) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(caption: caption.copyWith(fontSize: s));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onWeightChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              caption: caption.copyWith(
                  fontWeight: v ? FontWeight.bold : FontWeight.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onFontStyleChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              caption: caption.copyWith(
                  fontStyle: v ? FontStyle.italic : FontStyle.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
      ),
      TextStyleControl(
        'Overline',
        color: overline.color,
        fontSize: overline.fontSize,
        isBold: overline.fontWeight == FontWeight.bold,
        isItalic: overline.fontStyle == FontStyle.italic,
        onColorChanged: (c) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(overline: overline.copyWith(color: c));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onSizeChanged: (s) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(overline: overline.copyWith(fontSize: s));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onWeightChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              overline: overline.copyWith(
                  fontWeight: v ? FontWeight.bold : FontWeight.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onFontStyleChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              overline: overline.copyWith(
                  fontStyle: v ? FontStyle.italic : FontStyle.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
      ),
      TextStyleControl(
        'Display 1',
        color: display1.color,
        fontSize: display1.fontSize,
        isBold: display1.fontWeight == FontWeight.bold,
        isItalic: display1.fontStyle == FontStyle.italic,
        onColorChanged: (c) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(display1: display1.copyWith(color: c));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onSizeChanged: (s) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(display1: display1.copyWith(fontSize: s));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onWeightChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              display1: display1.copyWith(
                  fontWeight: v ? FontWeight.bold : FontWeight.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onFontStyleChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              display1: display1.copyWith(
                  fontStyle: v ? FontStyle.italic : FontStyle.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
      ),
      TextStyleControl(
        'Display 2',
        color: display2.color,
        fontSize: display2.fontSize,
        isBold: display2.fontWeight == FontWeight.bold,
        isItalic: display2.fontStyle == FontStyle.italic,
        onColorChanged: (c) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(display2: display2.copyWith(color: c));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onSizeChanged: (s) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(display2: display2.copyWith(fontSize: s));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onWeightChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              display2: display2.copyWith(
                  fontWeight: v ? FontWeight.bold : FontWeight.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onFontStyleChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              display2: display2.copyWith(
                  fontStyle: v ? FontStyle.italic : FontStyle.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
      ),
      TextStyleControl(
        'Display 3',
        color: display3.color,
        fontSize: display3.fontSize,
        isBold: display3.fontWeight == FontWeight.bold,
        isItalic: display3.fontStyle == FontStyle.italic,
        onColorChanged: (c) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(display1: display1.copyWith(color: c));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onSizeChanged: (s) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(display1: display1.copyWith(fontSize: s));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onWeightChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              subhead: subhead.copyWith(
                  fontWeight: v ? FontWeight.bold : FontWeight.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onFontStyleChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              subhead: subhead.copyWith(
                  fontStyle: v ? FontStyle.italic : FontStyle.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
      ),
      TextStyleControl(
        'Display 4',
        color: display4.color,
        fontSize: display4.fontSize,
        isBold: display4.fontWeight == FontWeight.bold,
        isItalic: display4.fontStyle == FontStyle.italic,
        onColorChanged: (c) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(display1: display1.copyWith(color: c));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onSizeChanged: (s) {
          args[Symbol(themeRef)] =
              txtTheme.copyWith(display1: display1.copyWith(fontSize: s));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onWeightChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              subhead: subhead.copyWith(
                  fontWeight: v ? FontWeight.bold : FontWeight.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
        onFontStyleChanged: (v) {
          args[Symbol(themeRef)] = txtTheme.copyWith(
              subhead: subhead.copyWith(
                  fontStyle: v ? FontStyle.italic : FontStyle.normal));
          model.updateTheme(Function.apply(theme.copyWith, null, args));
        },
      ),
    ];
  }
}

/*
Widget _getFieldRow(w1, w2) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [Expanded(child: w1), Expanded(child: w2)],
    );
*/
