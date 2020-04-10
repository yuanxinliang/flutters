import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '1.状态管理_2.0.provider.dart';

void main() {
  // 2.在应用程序的顶层ChangeNotifierProvider
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) {
            return XLCounterViewModel();
          },
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:MyContentPage(),
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
    return  Scaffold(
      appBar: AppBar(title: Text('Provider Of')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            XLShowData1(),
            SizedBox(height: 10),
            XLShowData2(),
          ],
        ),
      ),
    );
  }
}

class XLShowData1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 3.在其它位置使用共享的数据
    var counter = Provider.of<XLCounterViewModel>(context).counter;
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.cyanAccent,
      child: Text('计数器：${counter}', style: TextStyle(fontSize: 20)),
    );
  }
}

class XLShowData2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 3.在其它位置使用共享的数据
    var counter = Provider.of<XLCounterViewModel>(context).counter;
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.orangeAccent,
      child: Text('计数器：${counter}', style: TextStyle(fontSize: 20)),
    );
  }
}
