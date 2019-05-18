import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Insert your data";

  void _resetFields(){

    weightController.text = "";
    heightController.text = "";

    setState( () {
      _infoText = "Insert your data";
      _formKey = GlobalKey<FormState>();
    });

  }

  void _calculate(){
    setState( (){
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double bmi = weight / (height * height);

      if(bmi < 18.5){
        _infoText = "Underweight (${bmi.toStringAsPrecision(3)})";
      }
      else if(bmi >= 18.5 && bmi <= 24.9){
        _infoText = "Healthy Weight (${bmi.toStringAsPrecision(3)})";
      }
      else if(bmi >= 25.0 && bmi <= 29.9){
        _infoText = "Overweight (${bmi.toStringAsPrecision(3)})";
      }
      else if(bmi >= 30.0 && bmi <= 34.9){
        _infoText = "Obese (${bmi.toStringAsPrecision(3)})";
      }else if(bmi >= 35.0 && bmi <= 39.9){
        _infoText = "Severely Obese (${bmi.toStringAsPrecision(3)})";
      }else{
        _infoText = "Morbidly Obese (${bmi.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: _resetFields,)
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person, size: 120.0, color: Colors.green),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Weight (kg)",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
                controller: weightController,
                validator: (value){
                  if(value.isEmpty){
                    return "Insert your Weight!";
                  }
                },
              ), //TextField
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Height (cm)",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
                controller: heightController,
                validator: (value){
                  if(value.isEmpty){
                    return "Insert your Height!";
                  }
                },
              ), //TextField

              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child:  RaisedButton(
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        _calculate();
                      }
                    },
                    child: Text("Calculate",
                        style: TextStyle(color: Colors.white, fontSize: 25.0)),
                    color: Colors.green,
                  ),
                ),
              ),

              Text( _infoText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 25.0)
              ),
            ], //Widget
          ), //Column
        )
      )
    );
  }
}
