import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
      title: "People Counter",
      home: Stack(
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
              Text("PEOPLE: 0",
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
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      child: Text(
                        "-1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              Text("Come In",
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 30.0)), //Text
            ], //<Widget>
          )
        ],
      ))); //MaterialApp
}
