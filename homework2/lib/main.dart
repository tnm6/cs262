import 'package:flutter/material.dart';

void main() => runApp(SharedPreferences());

class SharedPreferences extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences Demo (Homework 2)',
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
    
  }
}
