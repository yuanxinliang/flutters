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
    return Center(
      child: Listener(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.orange,
        ),
        onPointerDown: (PointerDownEvent event) {
          print('onPointerDown');
        },
        onPointerMove: (PointerMoveEvent event) {
          print('onPointerMove');
        },
        onPointerUp: (PointerUpEvent event) {
          print('onPointerUp');
        },
        onPointerCancel: (PointerCancelEvent event) {
          print('onPointerCancel');
        },
      ),
    );
  }
}