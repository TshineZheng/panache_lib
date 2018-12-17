import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants.dart';
import '../theme_model.dart';
import 'action_bar.dart';
import 'panel_header.dart';
import 'panels/button_theme_panel.dart';
import 'panels/theme_color_panel.dart';
import 'panels/typography_panel.dart';

class ThemeEditor extends StatefulWidget {
  final ThemeData theme;

  ThemeEditor(this.theme);

  @override
  State<StatefulWidget> createState() => ThemeEditorState();
}

class ThemeEditorState extends State<ThemeEditor> {
  ThemeData get theme => widget.theme;

  bool buttonThemePanelExpanded = false;
  bool colorPanelExpanded = true;
  bool textPanelExpanded = false;
  bool primaryTextPanelExpanded = false;
  bool accentTextPanelExpanded = false;

  @override
  Widget build(BuildContext context) {
    final themeModel = ThemeModel.of(context);
    return Container(
      color: Colors.grey.shade200,
      child: Padding(
        padding: EdgeInsets.only(top: 24.0),
        child: ListView(
          children: [
            Padding(
              padding: kPadding,
              child: ActionBar(),
            ),
            ExpansionPanelList(
              expansionCallback: _onExpansionPanelUpdate,
              children: [
                _buildButtonThemePanel(themeModel),
                _buildColorsPanel(themeModel),
                _buildTextPanel(themeModel),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onExpansionPanelUpdate(int panelIndex, bool isExpanded) => setState(
        () {
          switch (panelIndex) {
            case 0:
              buttonThemePanelExpanded = !isExpanded;
              break;
            case 1:
              colorPanelExpanded = !isExpanded;
              break;
            case 2:
              textPanelExpanded = !isExpanded;
              break;
            case 3:
              primaryTextPanelExpanded = !isExpanded;
              break;
            case 4:
              accentTextPanelExpanded = !isExpanded;
              break;
          }
        },
      );

  ExpansionPanel _buildColorsPanel(ThemeModel themeModel) {
    return ExpansionPanel(
      isExpanded: colorPanelExpanded,
      headerBuilder: (context, isExpanded) => ExpanderHeader(
            icon: Icons.color_lens,
            color: theme.primaryColor,
            label: 'Colors',
          ),
      body: ThemeColorPanel(themeModel),
    );
  }

  ExpansionPanel _buildTextPanel(ThemeModel model) => ExpansionPanel(
        isExpanded: textPanelExpanded,
        headerBuilder: (context, isExpanded) => ExpanderHeader(
            label: 'Text Theme', icon: Icons.font_download, color: Colors.grey),
        body: TypographyThemePanel(model),
      );

  ExpansionPanel _buildButtonThemePanel(ThemeModel model) => ExpansionPanel(
        isExpanded: buttonThemePanelExpanded,
        headerBuilder: (context, isExpanded) => ExpanderHeader(
            label: 'Button Theme', icon: Icons.touch_app, color: Colors.grey),
        body: ButtonThemePanel(model),
      );
}
