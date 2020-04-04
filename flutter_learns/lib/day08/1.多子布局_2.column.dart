import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('首页')),
        body: MyContentPage(),
      ),
    );
  }
}

class MyContentPage extends StatefulWidget {
  @override
  _MyContentPageState createState() => _MyContentPageState();
}

class _MyContentPageState extends State<MyContentPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(width: 60, height: 40, color: Colors.red),
        Container(width: 30, height: 80, color: Colors.green),
        Container(width: 90, height: 120, color: Colors.blue),
        Container(width: 40, height: 80, color: Colors.orange),
      ],
    );
  }
}