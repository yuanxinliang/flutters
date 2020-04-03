import 'package:cate/ui/pages/home/home_page_content.dart';
import 'package:flutter/material.dart';

class XLHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: XLHomeContent(),
    );
  }
}
