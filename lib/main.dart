import 'package:flutter/material.dart';
import 'FormPage.dart';
import 'PostLogin.dart';
import 'postData.dart';
import 'Registration.dart';
import 'cards.dart';
import 'description.dart';
import 'teach.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    PL.tag: (context) => PL(),
    PostData.tag: (context) => PostData(),
    Registration.tag: (context) => Registration(),
    FormPage.tag: (context) => FormPage(),
    cards.tag: (context) => cards(),
    desc.tag: (context) => desc(),
    teachForm.tag: (context) => teachForm(),
  };
  static var token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySUQiOjIyfQ.d7JvsIzxacZiVbc9V1U9qrNCIJPwtpifmnnFii3ycG4';
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new FormPage(),
      routes: routes,
    );
  }
}
