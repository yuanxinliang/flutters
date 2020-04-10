import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('首页')),
        body: MyContentPage(),
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
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification noti){
        if (noti is ScrollStartNotification) {
          print('滚动开始...');
        } else if (noti is ScrollUpdateNotification) {
          print('滚动中...');
        } else if (noti is ScrollEndNotification) {
          print('滚动结束...');
        }
        return true;
      },
      child: ListView.separated(
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: Icon(Icons.people),
            title: Text('联系人${index}'),
          );
        },
        separatorBuilder: (ctx, index) {
          return Divider(color: Colors.orange, height: 0.5,);
        },
        itemCount: 100,
      ),
    );
  }
}