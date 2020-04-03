import 'package:flutter/material.dart';

class XLTheme {

  static final double _bodyFontSize = 14;
  static final double _smallFontSize = 16;
  static final double _middleFontSize = 18;
  static final double _largeFontSize = 20;

  // 普通模式
  static final ThemeData normalTheme = ThemeData(
    primarySwatch: Colors.pink,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    canvasColor: Color.fromRGBO(255, 254, 222, 1),
    textTheme: TextTheme(
      body1: TextStyle(fontSize: _bodyFontSize),
      display1: TextStyle(fontSize: _smallFontSize, color: Colors.black87),
      display2: TextStyle(fontSize: _middleFontSize, color: Colors.black87),
      display3: TextStyle(fontSize: _largeFontSize, color: Colors.black87),
    ),
  );

  // 深色模式
  static final ThemeData blackTheme = ThemeData();


}