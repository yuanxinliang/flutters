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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 1,
          children: List.generate(50, (index){
            final imgUrl = 'https://picsum.photos/300/300?random=${index}';
            return GestureDetector(
              child: Image.network(
                imgUrl,
                fit: BoxFit.cover,
              ),
              onTapDown: (_) {
                print(imgUrl);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}