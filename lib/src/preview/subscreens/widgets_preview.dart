import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonPreview extends StatelessWidget {
  final ThemeData theme;

  const ButtonPreview({Key key, this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Text(
            'RaisedButton',
            style: theme.textTheme.subhead,
          ),
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Text(
                  'IconButton',
                  style: theme.textTheme.subhead,
                ),
              ),
              IconButton(
                icon: Icon(Icons.save),
                onPressed: () {},
              ),
              Text('Enabled', style: theme.textTheme.caption),
              IconButton(icon: Icon(Icons.style), onPressed: null),
              Text(
                'Disabled',
                style: theme.textTheme.caption,
              ),
            ],
          ),
          Divider(),
          Row(
            children: <Widget>[
              Expanded(
                child: Text('Dropdown'),
              ),
              DropdownButton(
                  items: ['Paris', 'Moscou', 'Amsterdam']
                      .map((item) => DropdownMenuItem(child: Text(item)))
                      .toList(growable: false),
                  onChanged: (value) => print('dropdown value $value')),
            ],
          ),
          Divider(),
          Text('FlatButton', style: theme.textTheme.subhead),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Wrap(
              children: [
                FlatButton(onPressed: () {}, child: Text("Enabled")),
                FlatButton(onPressed: null, child: Text('Disabled')),
                FlatButton.icon(
                  icon: Icon(Icons.restore_from_trash),
                  onPressed: () {},
                  label: Text('FlatButton.icon'),
                ),
                FlatButton.icon(
                  icon: Icon(Icons.restore_from_trash),
                  onPressed: null,
                  label: Text('Disabled.icon'),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      child: Icon(Icons.person_pin),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
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
                  ],
                ),
              ),
            ),
          ),
          Text('Progress'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
