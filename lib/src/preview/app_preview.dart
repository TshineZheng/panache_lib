import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../theme_model.dart';
import 'widgets_preview.dart';

const kIPhone5 = const Size(640 / 2, 1136 / 2);
const kIPhone6 = const Size(750 / 2, 1334 / 2);
const kS6 = const Size(1440 / 4, 2560 / 4);

class AppPreviewContainer extends StatelessWidget {
  final Size size;

  AppPreviewContainer(this.size);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.grey.shade300,
        child: Center(
          child: Container(
            width: kIPhone6.width,
            height: kIPhone6.height,
            child: ThemePreviewApp(),
          ),
        ),
      ),
    );
  }
}

class TabItem {
  final String text;
  final IconData icon;

  TabItem(this.text, this.icon);
}

class ThemePreviewApp extends StatefulWidget {
  @override
  ThemePreviewAppState createState() {
    return new ThemePreviewAppState();
  }
}

class ThemePreviewAppState extends State<ThemePreviewApp>
    with SingleTickerProviderStateMixin {
  final _tabsItem = [
    TabItem('Butons', Icons.touch_app),
    TabItem('Controls', Icons.report),
    TabItem('Texte Themes', Icons.cloud_queue),
  ];

  TabController tabBarController;

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
    tabBarController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ThemeModel>(builder: (context, child, model) {
      final theme = model.theme;
      return MaterialApp(
        title: 'App Preview',
        debugShowCheckedModeBanner: false,
        home: AnimatedTheme(
          /*isMaterialAppTheme: true,*/
          data: theme,
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
              floatingActionButton: FloatingActionButton(
                child: Icon(
                  Icons.check,
                  color: theme?.accentTextTheme?.button?.color,
                ),
                onPressed: () {},
              ),
              drawer: Drawer(
                child: ListView(
                  children: <Widget>[
                    Text('Drawer'),
                  ],
                ),
              ),
              body: TabBarView(controller: tabBarController, children: [
                _buildButtonPreviewPage(theme),
                _buildWidgetPreviewPage(theme),
                _buildTypographyPreviewPage(theme)
              ]),
              bottomNavigationBar: BottomNavigationBar(items: bottomItems),
            ),
          ),
        ),
      );
    });
  }

  _buildTabBar() => TabBar(
      controller: tabBarController,
      tabs: _tabsItem
          .map((t) => Tab(
                text: t.text,
                icon: Icon(t.icon),
              ))
          .toList());

  Widget _buildButtonPreviewPage(ThemeData theme) =>
      ButtonPreview(theme: theme);

  Widget _buildWidgetPreviewPage(ThemeData theme) =>
      WidgetPreview1(theme: theme);

  Widget _buildTypographyPreviewPage(ThemeData theme) => Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(
              'Headline',
              style: theme.textTheme.headline,
            ),
            Text(
              'Subhead',
              style: theme.textTheme.subhead,
            ),
            Text(
              'Title',
              style: theme.textTheme.title,
            ),
            Text(
              'Body 1',
              style: theme.textTheme.body1,
            ),
            Text(
              'Body 2',
              style: theme.textTheme.body2,
            ),
            FlatButton(
                child: Text(
                  'button',
                  style: theme.textTheme.button,
                ),
                onPressed: () {}),
            Text(
              'Display 1',
              style: theme.textTheme.display1,
            ),
            Text(
              'Display 2',
              style: theme.textTheme.display2,
            ),
            Text(
              'Display 3',
              style: theme.textTheme.display3,
            ),
            Text(
              'Display 4',
              style: theme.textTheme.display4,
            ),
          ],
        ),
      );
}