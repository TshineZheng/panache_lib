import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants.dart';
import '../theme_model.dart';
import 'action_bar.dart';
import 'panel_header.dart';
import 'panels/button_theme_panel.dart';
import 'panels/chip_theme_panel.dart';
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

  bool chipThemePanelExpanded = false;
  bool colorPanelExpanded = false;
  bool buttonThemePanelExpanded = false;
  bool textPanelExpanded = false;
  bool primaryTextPanelExpanded = false;
  bool accentTextPanelExpanded = false;

  @override
  Widget build(BuildContext context) {
    final themeModel = ThemeModel.of(context);
    return Material(
      elevation: 4.0,
      color: Colors.blueGrey.shade100,
      child: ListView(
        children: [
          Padding(
            padding: kPadding,
            child: ActionBar(),
          ),
          ExpansionPanelList(
            expansionCallback: _onExpansionPanelUpdate,
            children: [
              _buildColorsPanel(themeModel),
              _buildButtonThemePanel(themeModel),
              _buildChipThemePanel(themeModel),
              _buildTextPanel(themeModel),
            ],
          )
        ],
      ),
    );
  }

  void _onExpansionPanelUpdate(int panelIndex, bool isExpanded) => setState(
        () {
          switch (panelIndex) {
            case 0:
              colorPanelExpanded = !isExpanded;
              break;
            case 1:
              buttonThemePanelExpanded = !isExpanded;
              break;
            case 2:
              chipThemePanelExpanded = !isExpanded;
              break;
            case 3:
              textPanelExpanded = !isExpanded;
              break;
            case 4:
              primaryTextPanelExpanded = !isExpanded;
              break;
            case 5:
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
              label: 'Text Theme',
              icon: Icons.font_download,
              color: theme.primaryColor,
            ),
        body: TypographyThemePanel(model),
      );

  ExpansionPanel _buildButtonThemePanel(ThemeModel model) => ExpansionPanel(
        isExpanded: buttonThemePanelExpanded,
        headerBuilder: (context, isExpanded) => ExpanderHeader(
              label: 'Button Theme',
              icon: Icons.touch_app,
              color: theme.primaryColor,
            ),
        body: ButtonThemePanel(model),
      );
  ExpansionPanel _buildChipThemePanel(ThemeModel model) => ExpansionPanel(
        isExpanded: chipThemePanelExpanded,
        headerBuilder: (context, isExpanded) => ExpanderHeader(
              label: 'Chip Theme',
              icon: Icons.dns,
              color: theme.primaryColor,
            ),
        body: ChipThemePanel(model),
      );
}
