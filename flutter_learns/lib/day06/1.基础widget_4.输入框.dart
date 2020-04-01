import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var width = window.physicalSize.width;
  var height = window.physicalSize.height;
  @override
  Widget build(BuildContext context) {
    print(width);
    print(height);
    print(window.physicalSize.aspectRatio);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('输入框')),
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

  final _phone = TextEditingController();
  final _pwd = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phone.text = '13500000000';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          _buildTextField1(),
          SizedBox(height: 20),
          _buildTextField2(),
          SizedBox(height: 20),
          _buildLoginButton()
        ],
      ),
    );
  }

  Widget _buildTextField1() {
    return Container(
      width: double.infinity,
      height: 50,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        color: Colors.cyanAccent,
        border: Border.all(width: 0.5),
        borderRadius: BorderRadius.circular(5)
      ),
      child: TextField(
        controller: _phone,
        keyboardType: TextInputType.phone,
        keyboardAppearance: Brightness.light,
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入手机号',
        ),
        onChanged: (text) {
          print('onChanged：' + text);
        },
        onSubmitted: (text) {
          print('onSubmitted：' + text);
        },
      ),
    );
  }

  Widget _buildTextField2() {
    return Container(
      width: double.infinity,
      height: 50,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          color: Colors.cyanAccent,
          border: Border.all(width: 0.5),
          borderRadius: BorderRadius.circular(5)
      ),
      child: TextField(
        controller: _pwd,
        keyboardType: TextInputType.visiblePassword,
        keyboardAppearance: Brightness.light,
        style: TextStyle(fontSize: 18),
        obscureText: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入密码',
        ),
        onChanged: (text) {
          print('onChanged：' + text);
        },
        onSubmitted: (text) {
          print('onSubmitted：' + text);
        },
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: FlatButton(
        color: Colors.orangeAccent,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
        ),
        child: Text('登录', style: TextStyle(color: Colors.white, fontSize: 20),),
        onPressed: () {
          print('phone：${_phone.text}');
        },
      ),
    );
  }
}