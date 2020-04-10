import 'package:flutter/material.dart';
import 'package:flutter_learns/day12/douban/pages/home.dart';
import 'package:flutter_learns/day12/douban/pages/subject.dart';

class XLMainScreen extends StatefulWidget {
  @override
  _XLMainScreenState createState() => _XLMainScreenState();
}

class _XLMainScreenState extends State<XLMainScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          HomePage(),
          SubjectPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('书影音')),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
