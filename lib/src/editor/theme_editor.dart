import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterial_components/src/editor/panels/dialog_theme_panel.dart';
import 'package:scoped_model/scoped_model.dart';

import '../theme_model.dart';
import 'action_bar.dart';
import 'panel_header.dart';
import 'panels/icon_theme_panel.dart';
import 'panels/panels.dart';

class ThemeEditor extends StatefulWidget {
  ThemeEditor();

  @override
  State<StatefulWidget> createState() => ThemeEditorState();
}

class ThemeEditorState extends State<ThemeEditor> {
  bool colorPanelExpanded = false;
  bool primaryTextPanelExpanded = false;
  bool accentTextPanelExpanded = false;
  bool buttonThemePanelExpanded = false;
  bool iconThemePanelExpanded = false;
  bool sliderThemePanelExpanded = false;
  bool tabBarThemePanelExpanded = false;
  bool chipThemePanelExpanded = false;
  bool dialogThemePanelExpanded = false;
  bool textPanelExpanded = false;

  @override
  Widget build(BuildContext context) {
    print('ThemeEditorState.build... ');

    return ScopedModelDescendant<ThemeModel>(
      builder: (BuildContext context, Widget child, model) {
        final primaryColor = model.theme.primaryColor;
        return Material(
          elevation: 4.0,
          color: Colors.blueGrey.shade100,
          child: ListView(
            children: [
              ActionBar(),
              ExpansionPanelList(
                expansionCallback: _onExpansionPanelUpdate,
                children: [
                  _buildPanel(
                    model,
                    'Colors',
                    child: ThemeColorPanel(model),
                    expanded: colorPanelExpanded,
                    icon: Icons.color_lens,
                    color: primaryColor,
                  ),
                  _buildPanel(
                    model,
                    'TabBar Theme',
                    child: TabBarThemePanel(model),
                    expanded: tabBarThemePanelExpanded,
                    icon: Icons.tab,
                    color: primaryColor,
                  ),
                  _buildPanel(
                    model,
                    'Button Theme',
                    child: ButtonThemePanel(model),
                    expanded: buttonThemePanelExpanded,
                    icon: Icons.touch_app,
                    color: primaryColor,
                  ),
                  _buildPanel(
                    model,
                    'Slider Theme',
                    child: SliderThemePanel(model),
                    expanded: sliderThemePanelExpanded,
                    icon: Icons.tune,
                    color: primaryColor,
                  ),
                  _buildPanel(
                    model,
                    'Chips Theme',
                    child: ChipThemePanel(model),
                    expanded: chipThemePanelExpanded,
                    icon: Icons.dns,
                    color: primaryColor,
                  ),
                  _buildPanel(
                    model,
                    'Text Theme',
                    child: TypographyThemePanel(),
                    expanded: textPanelExpanded,
                    icon: Icons.font_download,
                    color: primaryColor,
                  ),
                  _buildPanel(
                    model,
                    'Icon Themes',
                    child: IconThemePanel(model),
                    expanded: iconThemePanelExpanded,
                    icon: Icons.insert_emoticon,
                    color: primaryColor,
                  ),
                  _buildPanel(
                    model,
                    'Dialog Theme',
                    child: DialogThemePanel(model),
                    expanded: dialogThemePanelExpanded,
                    icon: Icons.check_box_outline_blank,
                    color: primaryColor,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  void _onExpansionPanelUpdate(int panelIndex, bool isExpanded) {
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
      case 6:
        dialogThemePanelExpanded = !isExpanded;
        break;
      case 7:
        iconThemePanelExpanded = !isExpanded;
        break;
    }

    setState(() {});
  }

  ExpansionPanel _buildPanel(ThemeModel model, String label,
          {bool expanded: false, IconData icon, Color color, Widget child}) =>
      ExpansionPanel(
        isExpanded: expanded,
        headerBuilder: (context, isExpanded) =>
            ExpanderHeader(icon: icon, color: color, label: label),
        body: child,
      );
}
