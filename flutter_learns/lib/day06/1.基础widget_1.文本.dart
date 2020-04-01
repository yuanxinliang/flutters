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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _textDemo1(),
        _textDemo2(),
      ],
    );
  }

  Widget _textDemo1() {
    final text = '《定风波》 苏轼 莫听穿林打叶声，何妨吟啸且徐行。竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。';
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        text,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: 30,
        ),
      ),
    );
  }
  
  Widget _textDemo2() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Text.rich(
        TextSpan(
          children: [
            WidgetSpan(
              child: Icon(
                Icons.play_circle_outline, color: Colors.red, size: 50,),
              alignment: PlaceholderAlignment.middle,
            ),
            TextSpan(text: '  '),
            TextSpan(text: 'honey',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextSpan(text: '1990',
                style: TextStyle(fontSize: 14, color: Color(0xffaaaaaa))),
          ],
        ),
      ),
    );
  }
}