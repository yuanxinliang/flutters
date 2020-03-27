import 'dart:math';

import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

class UserInfo {
  final String name;
  final int age;
  UserInfo(this.name, this.age);
}

final event = EventBus();

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        XLText(),
        XLButton(),
      ],
    );
  }
}

class XLText extends StatefulWidget {
  String name;
  int age;
  @override
  _XLTextState createState() => _XLTextState();
}

class _XLTextState extends State<XLText> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    event.on<UserInfo>().listen((UserInfo data) {
      setState(() {
        widget.name = data.name;
        widget.age = data.age;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Text(
        'name: ${widget.name}, age: ${widget.age}'
    );
  }
}

class XLButton extends StatefulWidget {
  @override
  _XLButtonState createState() => _XLButtonState();
}

class _XLButtonState extends State<XLButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('随机'),
        onPressed: () {
          print('1');
          final age = Random().nextInt(100);
          event.fire(UserInfo('lisan', age));
        }
    );
  }
}



