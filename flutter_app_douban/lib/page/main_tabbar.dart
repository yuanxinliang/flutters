import 'package:flutter/material.dart';
import 'package:flutterappdouban/page/sub_page/group.dart';
import 'package:flutterappdouban/page/sub_page/home.dart';
import 'package:flutterappdouban/page/sub_page/mall.dart';
import 'package:flutterappdouban/page/sub_page/profile.dart';
import 'package:flutterappdouban/page/sub_page/subject.dart';

class XLMainTabbar extends StatefulWidget {
  @override
  _XLMainTabbarState createState() => _XLMainTabbarState();
}

class _XLMainTabbarState extends State<XLMainTabbar> {

  int _currentIndex = 0;
  List<Widget> _subPages = [];
  List<BottomNavigationBarItem> _items = [];
  List<String> _titles = [];
  List<String> _images = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titles = ['首页', '书影音', '小组', '市集', '我的'];
    _images = ['home', 'subject', 'group', 'mall', 'profile'];
    _subPages = [XLHomePage(), XLSubjectPage(), XLGroupPage(), XLMallPage(), XLProfilePage()];
    for (int i = 0; i < _titles.length; i++) {
      _items.add(_bottomBarItem(_titles[i], _images[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.green,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent
      ),
      home: Scaffold(
        appBar: _appBar(),
        body: _body(),
        bottomNavigationBar: _bottomBar(),
      ),
    );
  }

  // app_bar
  Widget _appBar() {
    return AppBar(title: Text(_titles[_currentIndex]));
  }

  // body
  Widget _body() {
    return IndexedStack(
      index: _currentIndex,
      children: _subPages,
    );
  }

  // bottom_bar
  BottomNavigationBar _bottomBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      iconSize: 32,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      items: _items,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  // bottom_bar_item
  BottomNavigationBarItem _bottomBarItem(String title, String image) {
    return BottomNavigationBarItem(
      title: Text(title, style: TextStyle(fontSize: 12)),
      icon: Image(
        image: AssetImage('images/tab/${image}.png'),
        width: 32,
        height: 32,
        gaplessPlayback: true,
      ),
      activeIcon: Image(
        image: AssetImage('images/tab/${image}_active.png'),
        width: 32,
        height: 32,
        gaplessPlayback: true,
      ),
    );
  }

}

