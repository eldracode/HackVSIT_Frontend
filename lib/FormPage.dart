import 'package:flutter/material.dart';
import 'Registration.dart';
import 'PostLogin.dart';

class FormPage extends StatefulWidget {
  static String tag = 'lp';
  @override
  FormPageState createState() => new FormPageState();
}

class FormPageState extends State<FormPage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  static String email;
  static String password;

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

    if (form.validate()) {
      form.save();

      Navigator.of(context).pushNamed(PL.tag);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: scaffoldKey,
        appBar: new AppBar(
          title: new Text(
            'Login Page',
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
                    labelText: "Email",
                    hintText: "Enter Email Address",
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.black87),
                    contentPadding: const EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  validator: (val) =>
                      !val.contains('@') ? 'Email should contain @' : null,
                  onSaved: (val) => email = val,
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                ),
                new TextFormField(
                  decoration: new InputDecoration(
                      icon: Icon(Icons.phonelink_lock),
                      labelText: "Password",
                      hintText: "Enter Password",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.black87),
                      contentPadding: const EdgeInsets.all(8.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                  validator: (val) =>
                      val.length < 6 ? 'Password less than 6 characters' : null,
                  onSaved: (val) => password = val,
                  obscureText: true,
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                ),
                new RaisedButton(
                  child: new Text(
                    "login",
                    style: new TextStyle(color: Colors.white),
                  ),
                  color: Colors.black87,
                  onPressed: _submit,
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                ),
                new FlatButton(
                  child: new Text('New user ? Register here'),
                  onPressed: () =>
                      Navigator.of(context).pushNamed(Registration.tag),
                ),
              ],
            ),
          ),
        ));
  }
}
