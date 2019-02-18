import 'package:flutter/material.dart';
import 'postData.dart';

class Registration extends StatefulWidget {
  static String tag = 'reg';
  @override
  FormPageState createState() => new FormPageState();
}

class FormPageState extends State<Registration> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  static String email;
  static String password;
  static String username;

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

      performRegi();
    }
  }

  void performRegi() {
    Navigator.of(context).pushNamed(PostData.tag);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: scaffoldKey,
        appBar: new AppBar(
          title: new Text(
            'Registration Page',
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
                    icon: Icon(Icons.account_circle),
                    labelText: "Username",
                    hintText: "Enter username",
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.black87),
                    contentPadding: const EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (val) => val.contains('-')
                      ? 'Username should not contain hifen(s)'
                      : null,
                  onSaved: (val) => username = val,
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                ),
                new TextFormField(
                  decoration: new InputDecoration(
                    icon: Icon(Icons.alternate_email),
                    labelText: "Email",
                    hintText: "Enter Email Address",
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.black87),
                    contentPadding: const EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
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
                          borderRadius: BorderRadius.circular(10.0))),
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
                    "Register",
                    style: new TextStyle(color: Colors.white),
                  ),
                  color: Colors.black87,
                  onPressed: _submit,
                ),
              ],
            ),
          ),
        ));
  }
}
