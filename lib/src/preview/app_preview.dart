import 'package:flutter/material.dart';
import 'package:panache_lib/src/preview/subscreens/chips_preview.dart';
import 'package:scoped_model/scoped_model.dart';

import '../theme_model.dart';
import 'code_preview.dart';
import 'subscreens/inputs_preview.dart';
import 'subscreens/slider_preview.dart';
import 'subscreens/typography_preview.dart';
import 'subscreens/widgets_preview.dart';

const kIPhone5 = const Size(640 / 2, 1136 / 2);
const kIPhone6 = const Size(750 / 2, 1334 / 2);
const kS6 = const Size(1440 / 4, 2560 / 4);

class AppPreviewContainer extends StatefulWidget {
  final Size size;
  final bool showCode;

  AppPreviewContainer(this.size, {this.showCode});

  @override
  AppPreviewContainerState createState() {
    return new AppPreviewContainerState();
  }
}

class AppPreviewContainerState extends State<AppPreviewContainer> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ThemeModel>(builder: (context, child, model) {
      return Material(
        child: widget.showCode
            ? ThemeCodePreview(model)
            : Container(
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(color: Colors.blueGrey.shade800)),
                    color: Colors.blueGrey.shade700),
                child: Center(
                  child: Container(
                    width: widget.size.width,
                    height: widget.size.height,
                    child: ThemePreviewApp(theme: model.theme),
                  ),
                ),
              ),
      );
    });
  }
}

class TabItem {
  final String text;
  final IconData icon;

  TabItem(this.text, this.icon);
}

class ThemePreviewApp extends StatefulWidget {
  final ThemeData theme;

  const ThemePreviewApp({Key key, this.theme}) : super(key: key);

  @override
  ThemePreviewAppState createState() => ThemePreviewAppState();
}

class ThemePreviewAppState extends State<ThemePreviewApp>
    with SingleTickerProviderStateMixin {
  final _tabsItem = [
    TabItem('Controls', Icons.check_box),
    TabItem('Buttons', Icons.touch_app),
    TabItem('Inputs', Icons.keyboard),
    TabItem('Slider', Icons.tune),
    TabItem('Chips', Icons.dns),
    TabItem('Text', Icons.text_fields),
    /*TabItem('Color scheme', Icons.color_lens),*/
  ];

  TabController tabBarController;

  bool showFAB = true;

  get bottomItems => [
        {'label': 'Map', 'icon': Icons.map},
        {'label': 'Description', 'icon': Icons.description},
        {'label': 'Transform', 'icon': Icons.transform},
      ]
          .map((item) => BottomNavigationBarItem(
                icon: Icon(item['icon']),
                title: Text(item['label']),
              ))
          .toList();

  @override
  void initState() {
    super.initState();
    tabBarController = TabController(length: _tabsItem.length, vsync: this);
    tabBarController.addListener(() {
      setState(() {
        showFAB = tabBarController.index == 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Preview',
      debugShowCheckedModeBanner: false,
      home: AnimatedTheme(
        data: widget.theme,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text("App Preview"),
              bottom: _buildTabBar(),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.add), onPressed: () {}),
                IconButton(icon: Icon(Icons.add_a_photo), onPressed: () {}),
                IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () => Scaffold.of(context).openDrawer()),
              ],
            ),
            floatingActionButton: tabBarController.index == 0
                ? FloatingActionButton(
                    child: Icon(
                      Icons.check,
                      color: widget.theme?.accentTextTheme?.button?.color,
                    ),
                    onPressed: () {})
                : null,
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  Text('Drawer'),
                ],
              ),
            ),
            body: TabBarView(controller: tabBarController, children: [
              WidgetPreview1(theme: widget.theme),
              ButtonPreview(theme: widget.theme),
              InputsPreview(theme: widget.theme),
              SliderPreview(theme: widget.theme),
              ChipsPreview(theme: widget.theme),
              TypographyPreview(theme: widget.theme)
            ]),
            bottomNavigationBar: BottomNavigationBar(items: bottomItems),
          ),
        ),
      ),
    );
  }

  _buildTabBar() => TabBar(
      isScrollable: true,
      controller: tabBarController,
      tabs: _tabsItem
          .map((t) => Tab(
                text: t.text,
                icon: Icon(t.icon),
              ))
          .toList());
}
