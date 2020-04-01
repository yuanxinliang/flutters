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
      color: Colors.cyanAccent,
//      alignment: Alignment.topCenter,
      child: Image(
        width: 200,
        height: 300,
        fit: BoxFit.contain,
        alignment: Alignment.topCenter,
        image: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1585737277650&di=29cfcf0c66eb87004bcaf59a2c40b996&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F78%2F52%2F01200000123847134434529793168.jpg'),
      ),
    );
  }
}

/**
 * // 1.占位图的问题: FadeInImage
    // 2.图片缓存: 1000张 100m
    return FadeInImage(
    fadeOutDuration: Duration(milliseconds: 1),
    fadeInDuration: Duration(milliseconds: 1),
    placeholder: AssetImage("assets/images/juren.jpeg"),
    image: NetworkImage(imageURL),
    );
 * */