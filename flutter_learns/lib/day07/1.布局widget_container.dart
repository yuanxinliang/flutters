import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('首页')),
        body: Center(child: MyContentPage()),
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
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.cyanAccent,
//        borderRadius: BorderRadius.only(
//            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
//        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orangeAccent, width: 10, style: BorderStyle.solid),
        boxShadow: [
//          BoxShadow(color: Colors.green, offset: Offset(-10, 10), spreadRadius: 10, blurRadius: 20),
//          BoxShadow(color: Colors.green, offset: Offset(10, -10), spreadRadius: 10, blurRadius: 20),
//            BoxShadow(color: Colors.green, offset: Offset(-10, 10)),
//          BoxShadow(color: Colors.grey[300], offset: Offset(10, 0), blurRadius: 10),
//          BoxShadow(color: Colors.grey[300], offset: Offset(-10, 0), blurRadius: 10),
//          BoxShadow(color: Colors.grey[300], offset: Offset(0, 10), blurRadius: 10),
//          BoxShadow(color: Colors.grey[300], offset: Offset(0, -10), blurRadius: 10),
          BoxShadow(color: Colors.grey[300], offset: Offset(-10, 10), spreadRadius: 2, blurRadius: 20),
          BoxShadow(color: Colors.grey[300], offset: Offset(-10, -10), spreadRadius: 2, blurRadius: 20),
          BoxShadow(color: Colors.grey[300], offset: Offset(10, 10), spreadRadius: 2, blurRadius: 20),
          BoxShadow(color: Colors.grey[300], offset: Offset(10, -10), spreadRadius: 2, blurRadius: 20),
        ],
      ),
    );
  }
}