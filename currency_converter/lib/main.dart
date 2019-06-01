import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?key=83f2af0f";

void main() async{
  runApp(
      MaterialApp(
        home: Home()
      ));
}


Future<Map> getData() async{
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Converter \$"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text("Loading Data...",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 25.0
                  ),
                )
              );
            default:
              if(snapshot.hasError){
                return Center(
                    child: Text("Error loading data :(",
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 25.0
                      ),
                    )
                );
              }else{
                return Container(
                  color: Colors.green,
                );
              }
          }
        }
      )
    );
  }
}


