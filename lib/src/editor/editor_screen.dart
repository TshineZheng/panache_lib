import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../preview/app_preview.dart';
import '../theme_model.dart';
import 'drive_menu.dart';
import 'theme_editor.dart';

class PanacheEditorScreen extends StatefulWidget {
  @override
  PanacheEditorScreenState createState() {
    return new PanacheEditorScreenState();
  }
}

class PanacheEditorScreenState extends State<PanacheEditorScreen> {
  bool showCode = false;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final inPortrait = orientation == Orientation.portrait;
    final isLargeLayout = MediaQuery.of(context).size.shortestSide >= 600;
    final isMobileInPortrait = inPortrait && !isLargeLayout;

    return ScopedModelDescendant<ThemeModel>(
        builder: (BuildContext context, Widget child, ThemeModel model) {
      return isMobileInPortrait
          ? _buildMobilePortraitLayout(isMobileInPortrait, model)
          : _buildLargeLayout(isMobileInPortrait, model);
    });
  }

  Scaffold _buildLargeLayout(bool isMobileInPortrait, ThemeModel model) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: PanacheEditorTopbar(
        isMobileInPortrait: isMobileInPortrait,
        model: model,
        showCode: showCode,
        onShowCodeChanged: (value) => setState(() => showCode = value),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: ThemeEditor(model: model)),
          Expanded(child: AppPreviewContainer(kIPhone6, showCode: showCode)),
        ],
      ),
    );
  }

  Scaffold _buildMobilePortraitLayout(
      bool isMobileInPortrait, ThemeModel model) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: PanacheEditorTopbar(
        isMobileInPortrait: isMobileInPortrait,
        model: model,
        showCode: showCode,
        onShowCodeChanged: (value) => setState(() => showCode = value),
      ),
      drawer: Drawer(
        child: ThemeEditor(model: model),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: AppPreviewContainer(kIPhone6, showCode: showCode)),
        ],
      ),
    );
  }
}

class PanacheEditorTopbar extends StatelessWidget
    implements PreferredSizeWidget {
  final bool isMobileInPortrait;
  final ThemeModel model;
  final bool showCode;
  final ValueChanged<bool> onShowCodeChanged;

  PanacheEditorTopbar(
      {this.isMobileInPortrait,
      this.model,
      this.showCode,
      this.onShowCodeChanged});

  @override
  Widget build(BuildContext context) {
    if (isMobileInPortrait) {
      return AppBar(
        leading: IconButton(
            icon: Icon(Icons.color_lens),
            onPressed: () => Scaffold.of(context).openDrawer()),
        actions: [
          IconButton(
            icon: Icon(showCode ? Icons.mobile_screen_share : Icons.keyboard),
            onPressed: () => onShowCodeChanged(!showCode),
          ),
          DriveMenu(model: model),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.of(context).maybePop(),
          )
        ],
      );
    }

    return AppBar(
      actions: <Widget>[
        FlatButton.icon(
          textColor: Colors.blueGrey.shade50,
          icon: Icon(Icons.mobile_screen_share),
          label: Text('App preview'),
          onPressed: showCode ? () => onShowCodeChanged(false) : null,
        ),
        FlatButton.icon(
          textColor: Colors.blueGrey.shade50,
          icon: Icon(Icons.keyboard),
          label: Text('Code preview'),
          onPressed: showCode ? null : () => onShowCodeChanged(true),
        ),
        DriveMenu(model: model)
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
