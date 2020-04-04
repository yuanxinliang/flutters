import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ListView')),
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
  Widget build(BuildContext context) {
    return listDemo3();
  }

  Widget listDemo3() {
    return ListView.separated(
      itemCount: 100,
      itemBuilder: (ctx, index) {
        return ListTile(
          leading: Icon(Icons.people, color: Colors.orange,),
          trailing: Icon(Icons.favorite_border),
          title: Text('联系人${index + 1}', style: TextStyle(color: Colors.green),),
          subtitle: Text('联系人电话189667788${index + 1}'),
        );
      },
      separatorBuilder: (ctx, index) {
        return Divider(
          color: Colors.grey[400],
          height: 1,
          thickness: 0.5,
          indent: 15,
          endIndent: 15,
        );
      },
    );
  }

  Widget listDemo2() {
    return ListView.builder(
      itemCount: 100,
//      itemExtent: 50,
      itemBuilder: (ctx, index) {
        return ListTile(
          leading: Icon(Icons.people),
          trailing: Icon(Icons.favorite_border),
          title: Text('联系人${index + 1}', style: TextStyle(color: Colors.green),),
          subtitle: Text('联系人电话189667788${index + 1}'),
        );
      },
    );
  }

  Widget listDemo1() {
    return ListView(
      children: List.generate(100, (index) {
        return ListTile(
          leading: Icon(Icons.people),
          trailing: Icon(Icons.favorite_border),
          title: Text('联系人${index + 1}'),
          subtitle: Text('联系人电话189667788${index + 1}'),
        );
      }),
    );
  }
}