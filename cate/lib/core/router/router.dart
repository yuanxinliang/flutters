import 'package:flutter/material.dart';
import 'package:cate/ui/pages/tabbar/main_tabbar.dart';

class XLRouter {
  static final String initialRouter = XLMainTabBar.routerName;

  static final Map<String, WidgetBuilder> routers = {
    XLMainTabBar.routerName : (ctx) => XLMainTabBar(),
  };
}