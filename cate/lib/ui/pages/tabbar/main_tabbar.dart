import 'package:cate/ui/pages/tabbar/tabbar_children_item.dart';
import 'package:flutter/material.dart';

class XLMainTabBar extends StatefulWidget {
  static const String routerName = '/';
  @override
  _XLMainTabBarState createState() => _XLMainTabBarState();
}

class _XLMainTabBarState extends State<XLMainTabBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: XLMainTabBarSubWidgets.pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: XLMainTabBarSubWidgets.items,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
