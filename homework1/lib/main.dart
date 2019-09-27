/// Homework1 is a simple calculator app with 
/// addition, subtraction, multiplication, and division.

import 'package:flutter/material.dart';

void main() => runApp(Homework1());

class Homework1 extends StatelessWidget {
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

/// Calculator creates the layout and functions of the app
class Calculator extends State<CalculatorApp> {
  // Controllers for user input
  final _controllerNum1 = TextEditingController();
  final _controllerNum2 = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // Resultant value to be displayed after operations
  String _resultText = "";

  /// Methods for addition, subtraction, multiplication, and division
  /// See _sum() for explanation
  void _sum() {
    if (_formKey.currentState.validate()) {
      // Variables read from controllers in TextFormFields
      int num1 = int.parse(_controllerNum1.text);
      int num2 = int.parse(_controllerNum2.text);
      int result = num1 + num2; // sum the values

      setState(() {
        _resultText = "$num1 + $num2 = $result";  // print them with operator
      });
    }
  }
  void _difference() {
    if (_formKey.currentState.validate()) {
      int num1 = int.parse(_controllerNum1.text);
      int num2 = int.parse(_controllerNum2.text);
      int result = num1 - num2;

      setState(() {
        _resultText = "$num1 - $num2 = $result";
      });
    }
  }
  void _product() {
    if (_formKey.currentState.validate()) {
      int num1 = int.parse(_controllerNum1.text);
      int num2 = int.parse(_controllerNum2.text);
      int result = num1 * num2;

      setState(() {
        _resultText = "$num1 * $num2 = $result";
      });
    }
  }
  void _quotient() {
    if (_formKey.currentState.validate()) {
      int num1 = int.parse(_controllerNum1.text);
      int num2 = int.parse(_controllerNum2.text);
      double result = num1 / num2;

      setState(() {
        _resultText = "$num1 / $num2 = $result";
      });
    }
  }

  /// Layout of the Calculator,
  /// including two value fields and a row of basic operators
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
            // The two fields for input values
            TextFormField(
              controller: _controllerNum1,
              validator: (value) {  // Catches any empty inputs
                if (value.isEmpty) return "Please enter a number";
              },
              decoration: InputDecoration(hintText: "Enter Value 1"),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _controllerNum2,
              validator: (value) {  // Catches any empty inputs
                if (value.isEmpty) return "Please enter a number";
              },
              decoration: InputDecoration(hintText: "Enter Value 2"),
              keyboardType: TextInputType.number,
            ),
            // Row of buttons for operators (+, -, *, /)
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
            // Text field for resulting value
            Text(
              _resultText,
              style: TextStyle(fontSize: 20.0),
            ),
          ]
        ),
      ),
    );
  }
}
