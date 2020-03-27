import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.routeName,
      routes: _routes(),
      onGenerateRoute: _onGenerateRoute(),
      onUnknownRoute: _onUnknownRoute(),
    );
  }

  // 路由表
  Map<String, WidgetBuilder> _routes() {
    return {
      HomePage.routeName : (_) => HomePage(),
      DetailsPage.routeName : (_) => DetailsPage(),
    };
  }
  // 路由钩子：处理特殊需要传参的构造函数
  RouteFactory _onGenerateRoute() {
    return (settings) {
      if (settings.name == '/about') {
        return MaterialPageRoute(
            builder: (ctx){
              return AboutPage('版本号：1.0');
            }
        );
      }
      return null;
    };
  }
  //处理错误情况，找不到路由
  RouteFactory _onUnknownRoute() {
    return (settings) {
      return MaterialPageRoute(
        builder: (_) => ErrorPage()
      );
    };
  }
}

class HomePage extends StatefulWidget {
  static final String routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('主页')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_message ?? '未知参数'),
            RaisedButton(
              child: Text('进入详情界面'),
              onPressed: () {
                _jumpToDetailPage();
              },
            ),
            RaisedButton(
              child: Text('进入关于界面'),
              onPressed: () {
                _jumpToAboutPage();
              },
            ),
            RaisedButton(
              child: Text('进入未知界面'),
              onPressed: () {
                _jumpToErrorPage();
              },
            ),
          ],
        ),
      ),
    );
  }
  
  void _jumpToDetailPage() {

    // 跳转界面并传递参数
    Future future = Navigator.of(context).pushNamed(
      DetailsPage.routeName,
      arguments: '随机数${Random().nextInt(100)}',
    );
    // 接收下一个界面返回的数据内容
    future.then((value) {
      setState(() {
        _message = value;
      });
    });

  }

  void _jumpToAboutPage() {
    Navigator.of(context).pushNamed(AboutPage.routeName);
  }

  void _jumpToErrorPage() {
    Navigator.of(context).pushNamed('/aaaaa');
  }

}

class DetailsPage extends StatefulWidget {
  static final String routeName = '/detail';
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('详情页')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(message),
            RaisedButton(
              child: Text('返回主页'),
              onPressed: () => _backToHomePage(),
            )
          ],
        ),
      ),
    );
  }

  void _backToHomePage() {
    Navigator.of(context).pop('详情页返回的随机数${Random().nextInt(100)}');
  }
}

// 关于界面：用于路由钩子
class AboutPage extends StatelessWidget {
  static final String routeName = '/about';
  final String message;
  AboutPage(this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('关于')),
      body: Center(
        child: Text(message),
      ),
    );
  }
}

// 错误界面：当找不到路由表时，就会进入错误页
class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('错误页')),
      body: Center(
        child: Text('错误：404'),
      ),
    );
  }
}



