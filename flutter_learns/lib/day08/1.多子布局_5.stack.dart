import 'dart:ui';

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

/**
 * Stack默认的大小是包裹内容的
 *  - alignment: 从什么位置开始排布所有的子Widget
 *  - fit: expand(很少) 将子元素拉伸到尽可能大
 *  - overflow: 超出部分如何处理
 * Positioned
 */

class _MyContentPageState extends State<MyContentPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset('assets/images/juren.jpeg'),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(5),
            color: Color.fromARGB(155, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('进击的巨人是挺不错的', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                Icon(Icons.favorite, color: Colors.white,)
              ],
            ),
          ),
        )
      ],
    );
  }
}