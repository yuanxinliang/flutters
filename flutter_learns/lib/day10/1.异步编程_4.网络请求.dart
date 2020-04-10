import 'package:flutter/material.dart';
import 'package:flutter_learns/day10/networking/http_request.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('网络请求'),
            onPressed: () {
              HttpRequest.request('https://httpbin.org/get').then((value){
                print('结果：${value}');
              }).catchError((error){
                print('错误：${error.runtimeType}');
              });
            },
          ),
          RaisedButton(
            child: Text('百度请求'),
            onPressed: () {
              HttpRequest.request('https://www.baidu.com').then((value){
                print('结果：${value}');
              });
            },
          )
        ],
      ),
    );
  }
}