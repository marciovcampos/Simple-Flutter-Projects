import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
      title: "People Counter",
      home: Home()
  )); //MaterialApp
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _infoText = "Come In";

  void _changePeople(int delta){
      setState(() {
        _people += delta;

        if(_people < 0){
          _infoText = "Upside Down?";
        }else if(_people < 10){
          _infoText = "Come In";
        }else{
          _infoText = "Full";
        }

      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50.0),
            ),
            Text("PEOPLE: $_people",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)), //Text
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 140.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(_infoText,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0)), //Text
          ], //<Widget>
        )
      ],
    );
  }
}
