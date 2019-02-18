import 'package:flutter/material.dart';
import 'teach.dart';

class desc extends StatelessWidget {
  static String tag = 'desc';
  int id;
  String skill;
//desc({Key key, @required this.id,@required this.skill}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey,
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('Flutter'),
      ),
      body: new Container(
        child: Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 90.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 300.0),
                ),
                Icon(Icons.library_books),
                Padding(
                  padding: const EdgeInsets.only(right: 140.0),
                ),
                Icon(Icons.supervisor_account),
              ],
            ),
            new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 60.0),
                ),
                new RaisedButton(
                  child: new Text('Learn'),
                  onPressed: null,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 80.0),
                ),
                new RaisedButton(
                  child: new Text('Teach'),
                  onPressed: () {
                    Navigator.of(context).pushNamed(teachForm.tag);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
