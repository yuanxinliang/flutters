import 'package:flutter/material.dart';

class XLCounterWidget extends InheritedWidget {
  final int counter;

  XLCounterWidget({this.counter, Widget child}) : super(child: child);

  static XLCounterWidget of(BuildContext context) {
    // 沿着element树，去找到最近的
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(XLCounterWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return this.counter != oldWidget.counter;
  }
}

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyContentPage(),
    );
  }
}

class MyContentPage extends StatefulWidget {
  @override
  _MyContentPageState createState() => _MyContentPageState();
}

class _MyContentPageState extends State<MyContentPage> {
  int _counter = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inherited Widget')),
      body: XLCounterWidget(
        counter: _counter,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              XLShowData1(),
              XLShowData2(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _counter += 1;
          });
        },
      ),
    );
  }
}

class XLShowData1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int counter = XLCounterWidget.of(context).counter;
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.yellow,
      child: Text('计数器：${counter}'),
    );
  }
}

class XLShowData2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int counter = XLCounterWidget.of(context).counter;
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.cyanAccent,
      child: Text('计数器：${counter}'),
    );
  }
}

