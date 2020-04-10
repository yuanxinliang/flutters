import 'package:cate/ui/pages/home/home_page_content.dart';
import 'package:flutter/material.dart';

class XLHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('美食广场'),
        leading: GestureDetector(
          child: Icon(Icons.drag_handle),
          onTap: (){
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: XLHomeContent(),
    );
  }
}
