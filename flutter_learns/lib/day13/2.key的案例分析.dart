import 'dart:math';

import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyContentPage(),
    );
  }
}

class MyContentPage extends StatefulWidget {
  @override
  _MyContentPageState createState() => _MyContentPageState();
}

class _MyContentPageState extends State<MyContentPage> {
  final array = ['aaaa', 'bbbb', 'cccc', 'dddd'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: ListView(
        children: array.map((element){ return ListViewItemFul(name: element, key: UniqueKey(),);}).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            if (array.length > 0) {
              array.removeAt(0);
            }
          });
        },
      ),
    );
  }
}

class ListViewItemLess extends StatelessWidget {
  final String name;
  final randomColor = Color.fromARGB(
    255,
    Random().nextInt(256),
    Random().nextInt(256),
    Random().nextInt(256),
  );

  ListViewItemLess({this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: randomColor,
      child: Text(name, style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}

class ListViewItemFul extends StatefulWidget {
  final String name;
//  ListViewItemFul({this.name});
  ListViewItemFul({this.name, Key key}) : super(key: key);
  @override
  _ListViewItemFulState createState() => _ListViewItemFulState();
}

class _ListViewItemFulState extends State<ListViewItemFul> {
  final randomColor = Color.fromARGB(
    255,
    Random().nextInt(256),
    Random().nextInt(256),
    Random().nextInt(256),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: randomColor,
      child: Text(widget.name, style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}

