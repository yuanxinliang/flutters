import 'package:flutter/material.dart';
import 'Modules/discover_page.dart';
import 'Modules/my_page.dart';
import 'Modules/news_page.dart';
import 'Modules/tweet_page.dart';

import 'Modules/my_drawer.dart';

class XLMainPage extends StatefulWidget {
  @override
  _XLMainPageState createState() => _XLMainPageState();
}

class _XLMainPageState extends State<XLMainPage> {
  int _currentIndex = 0;
  List<String> titles = ['资讯', '动弹', '发现', '我的'];
  List<String> images = ['news', 'tweet', 'discover', 'my'];
  List<BottomNavigationBarItem> bottomItems = [];
  List<Widget> pages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 4; i++) {
      final item = BottomNavigationBarItem(
        title: Text(titles[i]),
        icon: Image.asset(
          'assets/images/ic_nav_${images[i]}_normal.png',
          width: 20,
          height: 20,
        ),
        activeIcon: Image.asset(
          'assets/images/ic_nav_${images[i]}_actived.png',
          width: 20,
          height: 20,
        ),
      );
      bottomItems.add(item);
    }
    pages = [NewsPage(), TweetPage(), Discover(), MyPage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titles[_currentIndex])),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 6,
        currentIndex: _currentIndex,
        items: bottomItems,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        selectedItemColor: Colors.green,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: pages[_currentIndex],
      drawer: MyDrawer(),
    );
  }
}
