import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'PostLogin.dart';

class cards extends StatefulWidget {
  static String tag = "cards";
  @override
  cardsState createState() => new cardsState();
}

// Create the state for our stateful widget
class cardsState extends State<cards> {
  static String url = 'http://206.189.133.65:8000/api/skill/all';
  static var data;
  Future<http.Request> fetchPost() async {
    final response = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: "${PLState.token}"},
    );
    // To modify the state of the app, use this method
    print(json.decode(response.body));
    setState(() {
      // Get the JSON data
      var dataConvertedToJSON = json.decode(response.body);
      // Extract the required part and assign it to the global variable named data
      data = dataConvertedToJSON['skills'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
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
                  margin:
                      new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                    child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.white24))),
                          child: Icon(Icons.autorenew, color: Colors.white),
                        ),
                        title: Text(
                          "${data[index]}",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            Icon(Icons.linear_scale,
                                color: Colors.yellowAccent),
                            Text(" Intermediate",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.white, size: 30.0)),
                  ),
                )
              ],
            )),
          );
        });
  }

  @override
  void initState() {
    super.initState();

    // Call the fetchPost() method when the app initializes
    this.fetchPost();
  }
}
