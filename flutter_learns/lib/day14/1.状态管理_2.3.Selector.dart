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
        ChangeNotifierProvider(
          create: (ctx) {
            return XLUserInfoViewModel();
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
      appBar: AppBar(title: Text('Consumer')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            XLShowData1(),
            SizedBox(height: 10),
            XLShowData2(),
            SizedBox(height: 10),
            XLShowData3(),
          ],
        ),
      ),
      floatingActionButton: Selector<XLCounterViewModel, XLCounterViewModel>(
        selector: (ctx, vm) => vm,
        shouldRebuild: (prev, next) => false,
        builder: (ctx, val, child) {
          print('againt');
          return FloatingActionButton(
            child: child,
            onPressed: () {
              val.counter += 1;
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class XLShowData1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.cyanAccent,
      // 3.在其它位置使用共享的数据
      child: Consumer(
        builder: (BuildContext context, XLCounterViewModel value, Widget child) {
          return Text('计数器：${value.counter}', style: TextStyle(fontSize: 20));
        },
      ),
    );
  }
}

class XLShowData2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.orangeAccent,
      // 3.在其它位置使用共享的数据
      child: Consumer<XLCounterViewModel>(
        builder: (ctx, val, child) {
          return Text('计数器：${val.counter}', style: TextStyle(fontSize: 20));
        },
      ),
    );
  }
}

class XLShowData3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.orangeAccent,
      // 3.在其它位置使用共享的数据
      child: Consumer2<XLCounterViewModel, XLUserInfoViewModel>(
        builder: (ctx, counteVMr, userInfoVM, child) {
          return Text('name:${userInfoVM.userInfo.name}, age:${counteVMr.counter}', style: TextStyle(fontSize: 20));
        },
      ),
    );
  }
}
