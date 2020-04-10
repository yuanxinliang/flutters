/**
 * 1.创建自己需要共享的数据
 * 2.在应用程序的顶层ChangeNotifierProvider
 * 3.在其它位置使用共享的数据
 *  > Provider.of: 当Provider中的数据发生改变时, Provider.of所在的Widget整个build方法都会重新构建
 *  > Consumer(相对推荐): 当Provider中的数据发生改变时, 执行重新执行Consumer的builder
 *  > Selector: 1.selector方法(作用,对原有的数据进行转换) 2.shouldRebuild(作用,要不要重新构建)
 */

import 'package:flutter/material.dart';

// 1.创建共享的数据；

class XLCounterViewModel extends ChangeNotifier {
  int _counter = 100;
  int get counter => _counter;
  set counter(int value) {
    _counter = value;
    notifyListeners();
  }
}

class UserInfo {
  String name;
  int age;
  UserInfo({this.name, this.age});
}

class XLUserInfoViewModel extends ChangeNotifier {
  UserInfo _userInfo = UserInfo(name: 'tony', age: 18);
  UserInfo get userInfo => _userInfo;
  set userInfo(UserInfo value) {
    _userInfo = value;
    notifyListeners();
  }
}