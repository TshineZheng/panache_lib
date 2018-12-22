import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants.dart';
import '../theme_model.dart';
import 'action_bar.dart';
import 'panel_header.dart';
import 'panels/panels.dart';

class ThemeEditor extends StatefulWidget {
  final ThemeData theme;

  ThemeEditor(this.theme);

  @override
  State<StatefulWidget> createState() => ThemeEditorState();
}

class ThemeEditorState extends State<ThemeEditor> {
  ThemeData get theme => widget.theme;

  bool sliderThemePanelExpanded = false;
  bool tabBarThemePanelExpanded = false;
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
              _buildTabBarThemePanel(themeModel),
              _buildButtonThemePanel(themeModel),
              _buildSliderThemePanel(themeModel),
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
              tabBarThemePanelExpanded = !isExpanded;
              break;
            case 2:
              buttonThemePanelExpanded = !isExpanded;
              break;
            case 3:
              sliderThemePanelExpanded = !isExpanded;
              break;
            case 4:
              chipThemePanelExpanded = !isExpanded;
              break;
            case 5:
              textPanelExpanded = !isExpanded;
              break;
            /*
            case 6:
              primaryTextPanelExpanded = !isExpanded;
              accentTextPanelExpanded = !isExpanded;
              break;*/
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

  ExpansionPanel _buildTabBarThemePanel(ThemeModel model) => ExpansionPanel(
        isExpanded: tabBarThemePanelExpanded,
        headerBuilder: (context, isExpanded) => ExpanderHeader(
              label: 'TabBar Theme',
              icon: Icons.tab,
              color: theme.primaryColor,
            ),
        body: TabBarThemePanel(model),
      );

  ExpansionPanel _buildSliderThemePanel(ThemeModel model) => ExpansionPanel(
        isExpanded: sliderThemePanelExpanded,
        headerBuilder: (context, isExpanded) => ExpanderHeader(
              label: 'Slider Theme',
              icon: Icons.tune,
              color: theme.primaryColor,
            ),
        body: SliderThemePanel(model),
      );
}
