/// Homework 2 is a simple app which uses SavedPreferences in order to save
/// and load one name value
/// 
/// Based on this tutorial by The Mobile Programmer:
///   https://youtu.be/Me22B6lR8Xc

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(SharedPreferencesDemo());

class SharedPreferencesDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences (Homework 2)',
      theme: ThemeData(
        primarySwatch: Colors.purple,
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
  String data = '';
  String nameKey = '_key_name';
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    const MethodChannel('plugins.flutter.io/shared_preferences')
        .setMockMethodCallHandler(
      (MethodCall methodcall) async {
        if(methodcall.method == 'getAll'){
          return {'flutter.' + nameKey: '[ No Name Saved ]'};
        }
        return null;
      },
    );
    setData();
  }

  Future<bool> saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(nameKey, controller.text);
  }

  Future<String> loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(nameKey);
  }

  setData() {
    loadData().then((value) {
      setState(() {
        data = value;
      });
    });
  }

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
            TextField(
              controller: controller,
              decoration: InputDecoration.collapsed(hintText: 'Enter Name'),
            ),
            OutlineButton(
              child: Text('SAVE NAME'),
              onPressed: (){
                saveData();
              },
            ),
            Text(
              data,
              style: TextStyle(fontSize: 20),
            ),
            OutlineButton(
              child: Text('LOAD NAME'),
              onPressed: (){
                setData();
              },
            )
          ],
        ),
      ),
    );
  }
}
