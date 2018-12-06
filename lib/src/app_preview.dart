import 'package:flutter/material.dart';
import 'package:flutterial_components/flutterial_components.dart';

const kIPhone5 = const Size(640 / 2, 1136 / 2);
const kIPhone6 = const Size(750 / 2, 1334 / 2);
const kS6 = const Size(1440 / 4, 2560 / 4);

class AppPreviewContainer extends StatelessWidget {
  final ThemeService service;
  final Size size;
  ThemeData get theme => service.theme;

  AppPreviewContainer(this.service, this.size);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.grey.shade300,
        child: Center(
          child: Container(
            width: kIPhone6.width,
            height: kIPhone6.height,
            /*decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(blurRadius: 4.0, color: Colors.grey.shade500)
              ],
            ),*/
            child: ThemePreviewApp(
              service: service,
            ),
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
  final ThemeService service;
  ThemeData get theme => service.theme;

  ThemePreviewApp({this.service});

  @override
  State<StatefulWidget> createState() => ThemePreviewAppState();
}

class ThemePreviewAppState extends State<ThemePreviewApp>
    with SingleTickerProviderStateMixin {
  double sliderValue = 0.5;

  ThemeData get theme => widget.service.theme;

  final tabsItem = [
    TabItem('Controls', Icons.report),
    TabItem('Texte Themes', Icons.cloud_queue),
  ];

  @override
  void initState() {
    super.initState();
  }

  get bottomItems => [
        {'label': 'Map', 'icon': Icons.map},
        {'label': 'Description', 'icon': Icons.description},
        {'label': 'Transform', 'icon': Icons.transform},
      ]
          .map(
            (item) => BottomNavigationBarItem(
                  icon: Icon(item['icon']),
                  title: Text(item['label']),
                ),
          )
          .toList();

  @override
  void didUpdateWidget(ThemePreviewApp oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.theme != null) theme = widget.theme;
  }

  @override
  Widget build(BuildContext context) => widget.service.themeNotifier.value != null
        ? MaterialApp(
          title: 'App Preview',
          debugShowCheckedModeBanner: false,
          home: Theme(
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
                  ],
                ),
                floatingActionButton: FloatingActionButton(
                  child: Icon(
                    Icons.check,
                    color: theme?.accentTextTheme?.button?.color,
                  ),
                  onPressed: () {},
                ),
                body: TabBarView(
                    children: [_buildTab1Content(), _buildTab2Content()]),
                bottomNavigationBar: BottomNavigationBar(items: bottomItems),
              ),
            ),
          ),
        )
      : Center(
          child: Text("Loading"),
        );

  _buildTabBar() => TabBar(
      tabs: tabsItem
          .map((t) => Tab(
                text: t.text,
                icon: Icon(t.icon),
              ))
          .toList());

  _buildTab1Content() => Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(onPressed: () {}, child: Text("A button")),
                  FlatButton(onPressed: () {}, child: Text('FlatButton')),
                  IconButton(
                    icon: Icon(
                      Icons.restore_from_trash,
                      color: theme?.textTheme?.button?.color,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Divider(),
            Row(
              children: [
                Checkbox(value: true, onChanged: (v) {}),
                Checkbox(value: false, onChanged: (v) {}),
                Checkbox(value: true, onChanged: null),
                Checkbox(value: false, onChanged: null),
              ],
            ),
            Divider(),
            Row(
              children: [
                Radio(value: false, onChanged: (v) {}, groupValue: null),
                Radio(value: true, onChanged: (v) {}, groupValue: true),
                Switch(value: false, onChanged: (v) {}),
                Switch(value: true, onChanged: (v) {}),
              ],
            ),
            Divider(),
            Slider(
                value: sliderValue,
                onChanged: (v) => setState(() => sliderValue = v)),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text('Dialog'),
                  onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) => Theme(
                            child: Dialog(
                              child: Container(
                                width: 420.0,
                                height: 420.0,
                                child: Text(
                                  'a simple dialog',
                                  style: theme.textTheme.headline,
                                ),
                              ),
                            ),
                            data: widget.theme),
                      ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: 0.57,
                  ),
                ),
                CircularProgressIndicator(
                  value: 0.57,
                  backgroundColor: Colors.yellow,
                ),
              ],
            ),
            IgnorePointer(
              child: TextField(
                decoration: const InputDecoration(
                    labelText: "Label text",
                    hintText: "Hint text",
                    errorText: "Error text example"),
                controller: TextEditingController(text: 'a textfield'),
              ),
            )
          ],
        ),
      );

  _buildTab2Content() => Padding(
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
