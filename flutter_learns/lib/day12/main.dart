import 'package:flutter/material.dart';
import 'package:flutter_learns/day12/douban/pages/main_screen.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: XLMainScreen(),
    );
  }
}