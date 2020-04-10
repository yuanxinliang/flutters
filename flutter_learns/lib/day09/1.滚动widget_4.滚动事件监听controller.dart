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
  final ScrollController controller = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener((){
      print(controller.offset);
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
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
    );
  }
}