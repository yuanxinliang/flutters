import 'package:cate/ui/pages/filter/filter_page.dart';
import 'package:cate/ui/pages/home/meal/meal_page.dart';
import 'package:cate/ui/pages/home/meal_detail/meal_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:cate/ui/pages/tabbar/main_tabbar.dart';

class XLRouter {
  static final String initialRouter = XLMainTabBar.routerName;
  static final Map<String, WidgetBuilder> routers = {
    XLMainTabBar.routerName : (ctx) => XLMainTabBar(),
    XLMealListPage.routerName : (ctx) => XLMealListPage(),
    XLMealDetailPage.routerName : (ctx) => XLMealDetailPage(),
  };

  static final RouteFactory generateRouter = (settings) {
    if (settings.name == XLFilterPage.routerName) {
      return MaterialPageRoute(
        builder: (_) => XLFilterPage(),
        fullscreenDialog: true,
      );
    }
    return null;
  };
}