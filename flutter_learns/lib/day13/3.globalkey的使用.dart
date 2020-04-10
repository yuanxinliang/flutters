import 'package:flutter/material.dart';

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
  final GlobalKey<_MyButtonState> globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: MyButton(key: globalKey),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print(globalKey.currentState.widget.message1);
          print(globalKey.currentState.message2);
        },
      ),
    );
  }
}

class MyButton extends StatefulWidget {
  final message1 = 'message1';
  MyButton({Key key}) : super(key: key);
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  final message2 = 'message2';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('🔘🔘🔘按钮🔘🔘🔘'),
    );
  }
}
