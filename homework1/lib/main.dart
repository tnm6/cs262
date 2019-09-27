import 'package:flutter/material.dart';

void main() => runApp(Homework1());

class Homework1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homework 1',
      home: CalculatorApp(),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  @override
  Calculator createState() => Calculator();
}

class Calculator extends State<CalculatorApp> {
  final _controllerNum1 = TextEditingController();
  final _controllerNum2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _resultText = "";

  void _sum() {
    if (_formKey.currentState.validate()) {
      double num1 = double.parse(_controllerNum1.text);
      double num2 = double.parse(_controllerNum2.text);
      double result = num1 + num2;

      setState(() {
        _resultText = "$num1 + $num2 = $result";
      });
    }
  }
  void _difference() {
    if (_formKey.currentState.validate()) {
      double num1 = double.parse(_controllerNum1.text);
      double num2 = double.parse(_controllerNum2.text);
      double result = num1 - num2;

      setState(() {
        _resultText = "$num1 - $num2 = $result";
      });
    }
  }
  void _product() {
    if (_formKey.currentState.validate()) {
      double num1 = double.parse(_controllerNum1.text);
      double num2 = double.parse(_controllerNum2.text);
      double result = num1 * num2;

      setState(() {
        _resultText = "$num1 * $num2 = $result";
      });
    }
  }
  void _quotient() {
    if (_formKey.currentState.validate()) {
      double num1 = double.parse(_controllerNum1.text);
      double num2 = double.parse(_controllerNum2.text);
      double result = num1 - num2;

      setState(() {
        _resultText = "$num1/$num2 = $result";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homework 1'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _controllerNum1,
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _controllerNum2,
              keyboardType: TextInputType.number,
            ),

            Text(
              _resultText,
              style: TextStyle(fontSize: 20.0),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: _sum,
                  child: Text('+'),
                ),
                RaisedButton(
                  onPressed: _difference,
                  child: Text('-'),
                ),
                RaisedButton(
                  onPressed: _product,
                  child: Text('*'),
                ),
                RaisedButton(
                  onPressed: _quotient,
                  child: Text('/'),
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}