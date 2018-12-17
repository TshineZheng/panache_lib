import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonPreview extends StatelessWidget {
  final ThemeData theme;

  const ButtonPreview({Key key, this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('ButtonPreview.build... ${theme.buttonColor} ${Colors.cyan}');
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Wrap(
              spacing: 8.0,
              children: [
                RaisedButton(
                  onPressed: () {},
                  child: Text("A button"),
                ),
                RaisedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add_box),
                  label: Text('RaisedButton.icon'),
                ),
                RaisedButton(onPressed: null, child: Text("Disabled")),
                RaisedButton.icon(
                  onPressed: null,
                  icon: Icon(Icons.add_box),
                  label: Text('Disabled with icon'),
                ),
              ],
            ),
          ),
          Divider(),
          Text('OutlineButton'),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Wrap(
              spacing: 8.0,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                OutlineButton(onPressed: () {}, child: Text("A button")),
                OutlineButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add_box),
                  label: Text('OutlineButton.icon'),
                ),
                OutlineButton(onPressed: null, child: Text("Disabled")),
                OutlineButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add_box),
                  label: Text('Disabled with icon icon'),
                ),
              ],
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.save,
                  color: theme?.textTheme?.button?.color,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.save,
                  color: theme?.textTheme?.button?.color,
                ),
                onPressed: null,
              ),
              Expanded(
                child: SizedBox(),
              ),
              DropdownButton(
                  items: ['Paris', 'Moscou', 'Amsterdam']
                      .map((item) => DropdownMenuItem(child: Text(item)))
                      .toList(growable: false),
                  onChanged: (value) => print('dropdown value $value'))
            ],
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Wrap(
              children: [
                FlatButton(onPressed: () {}, child: Text("A button")),
                FlatButton(onPressed: null, child: Text('FlatButton')),
                FlatButton.icon(
                  icon: Icon(
                    Icons.restore_from_trash,
                    color: theme?.textTheme?.button?.color,
                  ),
                  onPressed: () {},
                  label: Text('FlatButton.icon'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WidgetPreview1 extends StatelessWidget {
  final ThemeData theme;

  const WidgetPreview1({Key key, this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ListView(
        children: [
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
          Slider(value: 0.5, onChanged: (_) => {}),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CircleAvatar(
                          child: Icon(Icons.person_pin),
                        ),
                        RaisedButton(
                          child: Text('Datepicker'),
                          onPressed: () => showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100)),
                        ),
                        RaisedButton(
                          child: Text('Open Dialog'),
                          onPressed: () => _showDialog(context),
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
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Progress'),
              SizedBox(
                width: 200,
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
        ],
      ),
    );
  }

  void _showDialog(context) => showDialog(
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
            data: theme),
      );
}