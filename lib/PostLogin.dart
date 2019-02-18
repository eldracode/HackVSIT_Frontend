import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'FormPage.dart';
import 'description.dart';
import 'dart:io';

class PL extends StatefulWidget {
  static String tag = 'PL';
  @override
  PLState createState() => new PLState();
}

class PLState extends State<PL> {
  static var token =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySUQiOjIyfQ.d7JvsIzxacZiVbc9V1U9qrNCIJPwtpifmnnFii3ycG4';
  Future<http.Response> postRequest() async {
    var url = 'http://206.189.133.65:8000/api/user/login';
    var body = jsonEncode({
      "email": '${FormPageState.email}',
      "password": '${FormPageState.password}'
    });

    print("Body: " + body);
    var res = await http
        .post(url, body: body, headers: {"Content-Type": "application/json"});

    print(jsonDecode(res.body));
    var dataConvertedToJSON = json.decode(res.body);
    // Extract the required part and assign it to the global variable named data
    var data = dataConvertedToJSON['account'];
    token = data["token"];
    var status = dataConvertedToJSON['status'];
    print(status);
  }

  static String url = 'http://206.189.133.65:8000/api/skill/all';
  static var data;
  Future<http.Request> fetchPost() async {
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: "$token"
      },
    );
    // To modify the state of the app, use this method
    print(json.decode(response.body));
    setState(() {
      // Get the JSON data
      var dataConvertedToJSON = json.decode(response.body);
      // Extract the required part and assign it to the global variable named data
      data = dataConvertedToJSON['skills'];
      print(data[1]["description"]);
    });
  }

  @override
  void initState() {
    super.initState();

    postRequest();
    fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('After Login'),
      ),
      body: new ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return new Container(
              child: new Center(
                  child: new Column(
                // Stretch the cards in horizontal axis
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    elevation: 8.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                      child: ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed(desc.tag);
                          },
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: new BoxDecoration(
                                border: new Border(
                                    right: new BorderSide(
                                        width: 1.0, color: Colors.white24))),
                            child:
                                Icon(Icons.arrow_forward, color: Colors.white),
                          ),
                          title: Text(
                            "${data[index]["name"]}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                          trailing: Icon(Icons.keyboard_arrow_right,
                              color: Colors.white, size: 30.0)),
                    ),
                  )
                ],
              )),
            );
          }),
    );
  }
}
//abc@gmail.com
