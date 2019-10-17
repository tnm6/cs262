import 'package:flutter/material.dart';

void main() => runApp(SharedPreferences());

class SharedPreferences extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences (Homework 2)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SharedPreferencesPage(),
    );
  }
}

class SharedPreferencesPage extends StatefulWidget {
  @override
  State createState() => new SharedPreferencesState();
}

class SharedPreferencesState extends State<SharedPreferencesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences (Homework 2)')
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
