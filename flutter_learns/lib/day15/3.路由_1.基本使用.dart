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

  String _message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(_message ?? '未知'),
        RaisedButton(
          child: Text('详情'),
          onPressed: () {
            _jumpToDetailPage();
          },
        )
      ],
    );
  }

  void _jumpToDetailPage() {
    Future future = Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) {
        return XLDetailPage('主页传过来的参数');
      }
    ));
    future.then((value) {
      setState(() {
        _message = value;
      });
    });
  }
}

class XLDetailPage extends StatefulWidget {

  final String _message;

  XLDetailPage(this._message);

  @override
  _XLDetailPageState createState() => _XLDetailPageState();
}

class _XLDetailPageState extends State<XLDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget._message ?? '未知'),
            RaisedButton(
              child: Text('返回主页'),
              onPressed: () {
                Navigator.of(context).pop('详情页返回的参数');
              },
            ),
          ],
        ),
      ),
    );
  }
}
