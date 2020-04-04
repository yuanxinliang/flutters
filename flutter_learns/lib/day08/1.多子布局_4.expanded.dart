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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(flex: 2, child: Container(width: 60, height: 40, color: Colors.red)),
        Expanded(flex: 1, child: Container(width: 30, height: 80, color: Colors.green)),
        Container(width: 90, height: 120, color: Colors.blue),
        Container(width: 40, height: 80, color: Colors.orange),
      ],
    );
  }
}