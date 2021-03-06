import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mywidget/ui/default_title.dart';

class ButtonView extends StatefulWidget {
  @override
  _ButtonViewState createState() => _ButtonViewState();
}

class _ButtonViewState extends State<ButtonView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              DefaultTitle("Normal Button"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 16,
                  children: <Widget>[
                    RaisedButton(
                      child: Text("Raise Button"),
                      onPressed: _onPressed,
                    ),
                    FlatButton(
                      child: Text("Flat Button"),
                      onPressed: _onPressed,
                    ),
                    OutlineButton(
                      child: Text("Outline Button"),
                      onPressed: _onPressed,
                    ),
                    ButtonTheme(
                      shape: StadiumBorder(),
                      child: RaisedButton(
                        child: Text("Stadium Border"),
                        onPressed: _onPressed,
                      ),
                    ),
                    ButtonTheme(
                      shape: UnderlineInputBorder(),
                      child: RaisedButton(
                        child: Text("Underline Button"),
                        onPressed: _onPressed,
                      ),
                    ),
                    RaisedButton(
                      child: Text("Disable Button"),
                    ),
                  ],
                ),
              ),
              Divider(height: 16),
              DefaultTitle("Primary Button"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ButtonTheme(
                  textTheme: ButtonTextTheme.primary,
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 16,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("Raise Button"),
                        onPressed: _onPressed,
                      ),
                      FlatButton(
                        child: Text("Flat Button"),
                        onPressed: _onPressed,
                      ),
                      OutlineButton(
                        child: Text("Outline Button"),
                        onPressed: _onPressed,
                      ),
                      RaisedButton(
                        child: Text("Disable Button"),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(height: 16),
              DefaultTitle("Button Bar"),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: Text("Flat Button"),
                    onPressed: _onPressed,
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                    child: Icon(
                      Icons.extension,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: _onPressed,
                  )
                ],
              ),
              Divider(height: 16),
              DefaultTitle("Toggle Buttons"),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ToggleButtons(
                  onPressed: (index) {
                    setState(() {
                      isSelected[index] = !isSelected[index];
                    });
                  },
                  children: <Widget>[
                    Icon(Icons.cake),
                    Icon(Icons.directions_car),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text("Both All"),
                    )
                  ],
                  isSelected: isSelected,
                ),
              ),
              Divider(height: 16),
              DefaultTitle(
                "Dropdown Button",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  isExpanded: true,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['One 1', 'Two 2', 'Three 2', 'Four 4']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Popup Menu Button",
                        maxLines: 1,
                      ),
                    ),
                    PopupMenuButton<int>(
                      icon: Icon(Icons.filter),
                      onSelected: (result) {
                        setState(() {
                          index = result;
                        });
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<int>>[
                        PopupMenuItem<int>(
                          value: 0,
                          child: Text('All'),
                        ),
                        PopupMenuItem<int>(
                          value: 1,
                          child: Text('1 day'),
                        ),
                        PopupMenuItem<int>(
                          value: 2,
                          child: Text('2 days'),
                        ),
                        PopupMenuItem<int>(
                          value: 3,
                          child: Text('3 days'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ]),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16 + MediaQuery.of(context).padding.bottom,
            ),
          ),
        ],
      ),
    );
  }

  String dropdownValue = 'One 1';
  int index = 0;

  var isSelected = [false, false, true];

  void _onPressed() {}
}
