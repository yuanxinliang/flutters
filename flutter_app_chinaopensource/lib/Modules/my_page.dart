import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      child: Center(
        child: Text('我的'),
      ),
    );
  }
}
