import 'package:cate/ui/pages/favorite/favorite_page.dart';
import 'package:cate/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class XLMainTabBarSubWidgets {

  static final List<Widget> pages = [XLHomePage(), XLFavoritePage()];

  static final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home, size: 28,),
      title: Text('首页'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border, size: 28,),
      title: Text('收藏'),
    ),
  ];

}