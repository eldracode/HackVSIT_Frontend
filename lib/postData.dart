import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'user.dart';

import 'dart:convert';
import 'dart:async';
import 'Registration.dart';

class PostData extends StatefulWidget {
  static String tag = 'post';
  @override
  PostDataState createState() => new PostDataState();
}

class PostDataState extends State<PostData> {
  static var token;
  Future<http.Response> postRequest() async {
    var url = 'http://206.189.133.65:8000/api/user/new';
    var body = jsonEncode({
      "username": '${FormPageState.username}',
      "email": '${FormPageState.email}',
      "password": '${FormPageState.password}'
    });

    print("Body: " + body);
    var res = await http
        .post(url, body: body, headers: {"Content-Type": "application/json"});

    var dataConvertedToJSON = json.decode(res.body);
    // Extract the required part and assign it to the global variable named data
    var data = dataConvertedToJSON['account'];
    token = data["token"];
  }

  @override
  void initState() {
    super.initState();

    postRequest();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text('after post')),
      body: new Container(),
    );
  }
}
