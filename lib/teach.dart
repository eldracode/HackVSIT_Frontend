import 'package:flutter/material.dart';

class teachForm extends StatefulWidget {
  static String tag = 'teach';
  @override
  teachFormState createState() => new teachFormState();
}

class teachFormState extends State<teachForm> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  static String experience;
  static String description;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _submit() {
    final form = formKey.currentState;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: scaffoldKey,
        appBar: new AppBar(
          title: new Text(
            'Add some details',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black54,
        ),
        body: new Padding(
          padding: const EdgeInsets.all(40.0),
          child: new Form(
            key: formKey,
            child: new Column(
              children: <Widget>[
                new TextFormField(
                  decoration: new InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: "Experience",
                    hintText: "Enter Experience",
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.black87),
                    contentPadding: const EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (val) =>
                      val.length > 10 ? 'Enter small experience' : null,
                  onSaved: (val) => experience = val,
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                ),
                new TextFormField(
                  maxLines: 15,
                  decoration: new InputDecoration(
                      icon: Icon(Icons.phonelink_lock),
                      labelText: "Description",
                      // hintText: "Enter Description",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.black87),
                      contentPadding: const EdgeInsets.all(8.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  validator: (val) =>
                      val.length < 1 ? 'Enter long description' : null,
                  onSaved: (val) => description = val,
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                ),
                new RaisedButton(
                  child: new Text(
                    "Send Details",
                    style: new TextStyle(color: Colors.white),
                  ),
                  color: Colors.black87,
                  onPressed: _submit,
                )
              ],
            ),
          ),
        ));
  }
}
