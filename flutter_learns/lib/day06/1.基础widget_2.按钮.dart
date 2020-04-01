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
      child: Column(
        children: <Widget>[
          // 1、RaisedButton
          RaisedButton(
            child: Text('RaisedButton', style: TextStyle(fontSize: 20),),
            textColor: Colors.red, // 文字色
            color: Colors.purple, // 背景色
            onPressed: () {
              print('raise..');
            },
          ),
          // 2、FlatButton
          FlatButton(
            child: Text('FlatButton', style: TextStyle(fontSize: 20),),
            textColor: Colors.cyan,
            color: Colors.orangeAccent,
            onPressed: () {
              print('FlatButton');
            },
          ),
          // 3、OutlineButton
          OutlineButton(
            child: Text('OutlineButton', style: TextStyle(fontSize: 20),),
            textColor: Colors.blue,
            color: Colors.cyan,
            onPressed: () => print('OutlineButton'),
          ),
          // 4、FloatingActionButton
          FloatingActionButton(
            child: Icon(Icons.favorite_border),
          ),
          // 5、自定义 button
          ButtonTheme(
            minWidth: 1,
            height: 1,
            child: FlatButton(
              padding: EdgeInsets.all(5),
              color: Colors.lightGreen,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.favorite_border, size: 40,),
                  SizedBox(width: 5,),
                  Text('LikeLikeLikeLike', style: TextStyle(fontSize: 30),)
                ],
              ),
              onPressed: () {
                print('custom button.');
              },
            ),
          )
        ],
      ),
    );
  }
}