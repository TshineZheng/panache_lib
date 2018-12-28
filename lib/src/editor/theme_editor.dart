import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../theme_model.dart';
import 'action_bar.dart';
import 'panel_header.dart';
import 'panels/dialog_theme_panel.dart';
import 'panels/icon_theme_panel.dart';
import 'panels/input_decoration_theme_panel.dart';
import 'panels/panels.dart';

class ThemeEditor extends StatefulWidget {
  final ThemeModel model;

  ThemeEditor({this.model});

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
  bool inputsPanelExpanded = false;

  @override
  Widget build(BuildContext context) {
    final primaryColor = widget.model.theme.primaryColor;
    return Container(
      /*elevation: 4.0,*/
      color: Colors.blueGrey.shade100,
      child: ListView(
        /*shrinkWrap: true,*/
        children: [
          GlobalThemePropertiesControl(),
          ExpansionPanelList(
            expansionCallback: _onExpansionPanelUpdate,
            children: [
              _buildPanel(
                widget.model,
                'Colors',
                child: ThemeColorPanel(widget.model),
                expanded: colorPanelExpanded,
                icon: Icons.color_lens,
                color: primaryColor,
              ),
              _buildPanel(
                widget.model,
                'Button Theme',
                child: ButtonThemePanel(widget.model),
                expanded: buttonThemePanelExpanded,
                icon: Icons.touch_app,
                color: primaryColor,
              ),
              _buildPanel(
                widget.model,
                'Inputs',
                child: InputDecorationThemePanel(widget.model),
                expanded: inputsPanelExpanded,
                icon: Icons.keyboard,
                color: primaryColor,
              ),
              _buildPanel(
                widget.model,
                'TabBar Theme',
                child: TabBarThemePanel(widget.model),
                expanded: tabBarThemePanelExpanded,
                icon: Icons.tab,
                color: primaryColor,
              ),
              _buildPanel(
                widget.model,
                'Slider Theme',
                child: SliderThemePanel(widget.model),
                expanded: sliderThemePanelExpanded,
                icon: Icons.tune,
                color: primaryColor,
              ),
              _buildPanel(
                widget.model,
                'Text Theme',
                child: TypographyThemePanel(),
                expanded: textPanelExpanded,
                icon: Icons.font_download,
                color: primaryColor,
              ),
              _buildPanel(
                widget.model,
                'Chips Theme',
                child: ChipThemePanel(widget.model),
                expanded: chipThemePanelExpanded,
                icon: Icons.dns,
                color: primaryColor,
              ),
              _buildPanel(
                widget.model,
                'Icon Themes',
                child: IconThemePanel(widget.model),
                expanded: iconThemePanelExpanded,
                icon: Icons.insert_emoticon,
                color: primaryColor,
              ),
              _buildPanel(
                widget.model,
                'Dialog Theme',
                child: DialogThemePanel(widget.model),
                expanded: dialogThemePanelExpanded,
                icon: Icons.check_box_outline_blank,
                color: primaryColor,
              ),
            ],
          )
        ],
      ),
    );
  }

  void _onExpansionPanelUpdate(int panelIndex, bool isExpanded) {
    switch (panelIndex) {
      case 0:
        colorPanelExpanded = !isExpanded;
        break;
      case 1:
        buttonThemePanelExpanded = !isExpanded;
        break;
      case 2:
        inputsPanelExpanded = !isExpanded;
        break;
      case 3:
        tabBarThemePanelExpanded = !isExpanded;
        break;
      case 4:
        sliderThemePanelExpanded = !isExpanded;
        break;
      case 5:
        textPanelExpanded = !isExpanded;
        break;
      case 6:
        chipThemePanelExpanded = !isExpanded;
        break;
      case 7:
        iconThemePanelExpanded = !isExpanded;
        break;
      case 8:
        dialogThemePanelExpanded = !isExpanded;
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
