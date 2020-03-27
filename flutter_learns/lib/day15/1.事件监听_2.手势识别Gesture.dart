import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('手势识别')),
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.cyan
              ),
              onTap: () {
                print('点击');
              },
              onDoubleTap: () {
                print('双击');
              },
              onLongPress: () {
                print('长按');
              },
              onTapDown: (_) {
                print('点下');
              },
            ),
            GestureDetector(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.amberAccent,
              ),
              onTap: () {
                print('--点击--');
              },
              onTapDown: (_) {
                print('--点下--');
              },
            )
          ],
        )
    );
  }
}