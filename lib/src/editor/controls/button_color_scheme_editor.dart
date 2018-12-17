import 'package:flutter/material.dart';
import 'package:flutterial_components/src/editor/controls/color_selector.dart';

const List<String> colors = [
  'background',
  'error',
  'onBackground',
  'onError',
  'onPrimary',
  'onSecondary',
  'onSurface',
  'surface',
  'primary',
  'primaryVariant',
  'secondary',
  'secondaryVariant'
];

enum SchemeColors {
  background,
  error,
  onBackground,
  onError,
  onPrimary,
  onSecondary,
  onSurface,
  surface,
  primary,
  primaryVariant,
  secondary,
  secondaryVariant
}

class ButtonColorSchemeControl extends StatelessWidget {
  final ColorScheme scheme;
  final ValueChanged<ColorScheme> onSchemeChanged;

  const ButtonColorSchemeControl(
      {Key key, @required this.scheme, @required this.onSchemeChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Color scheme',
            style: appTheme.title,
          )
        ]..addAll(_buildColorSchemeControls()),
      ),
    );
  }

  Iterable<Widget> _buildColorSchemeControls() {
    return colors.map((property) {
      return ColorSelector(property, _getSchemeColor(property),
          (color) => _onColorChanged(property, color));
    }).toList(growable: false);
  }

  Color _getSchemeColor(String property) {
    print('ButtonColorSchemeControl._getSchemeColor... ${SchemeColors.values}');
    final schemeColor = SchemeColors.values
        .firstWhere((sc) => '$sc'.split('.').last == property);
    switch (schemeColor) {
      case SchemeColors.primary:
        return scheme.primary;
      case SchemeColors.primaryVariant:
        return scheme.primaryVariant;
      case SchemeColors.secondary:
        return scheme.secondary;
      case SchemeColors.secondaryVariant:
        return scheme.secondaryVariant;
      case SchemeColors.background:
        return scheme.background;
      case SchemeColors.surface:
        return scheme.surface;
      case SchemeColors.error:
        return scheme.error;
      case SchemeColors.onPrimary:
        return scheme.onPrimary;
      case SchemeColors.onSecondary:
        return scheme.onSecondary;
      case SchemeColors.onBackground:
        return scheme.onBackground;
      case SchemeColors.onSurface:
        return scheme.onSurface;
      case SchemeColors.onError:
        return scheme.onError;
    }
    return Colors.white;
  }

  void _onColorChanged(String property, Color color) {
    final schemeColor = SchemeColors.values
        .firstWhere((sc) => '$sc'.split('.').last == property);
    switch (schemeColor) {
      case SchemeColors.primary:
        onSchemeChanged(scheme.copyWith(primary: color));
        break;
      case SchemeColors.primaryVariant:
        onSchemeChanged(scheme.copyWith(primaryVariant: color));
        break;
      case SchemeColors.secondary:
        onSchemeChanged(scheme.copyWith(secondary: color));
        break;
      case SchemeColors.secondaryVariant:
        onSchemeChanged(scheme.copyWith(secondaryVariant: color));
        break;
      case SchemeColors.background:
        onSchemeChanged(scheme.copyWith(background: color));
        break;
      case SchemeColors.surface:
        onSchemeChanged(scheme.copyWith(surface: color));
        break;
      case SchemeColors.error:
        onSchemeChanged(scheme.copyWith(error: color));
        break;
      case SchemeColors.onPrimary:
        onSchemeChanged(scheme.copyWith(onPrimary: color));
        break;
      case SchemeColors.onSecondary:
        onSchemeChanged(scheme.copyWith(onSecondary: color));
        break;
      case SchemeColors.onBackground:
        onSchemeChanged(scheme.copyWith(onBackground: color));
        break;
      case SchemeColors.onSurface:
        onSchemeChanged(scheme.copyWith(onSurface: color));
        break;
      case SchemeColors.onError:
        onSchemeChanged(scheme.copyWith(onError: color));
        break;
    }
  }
}
