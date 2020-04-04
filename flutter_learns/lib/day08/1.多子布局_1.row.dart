import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('首页')),
        body: MyContentPage(),
      ),
    );
  }
}

class MyContentPage extends StatefulWidget {
  @override
  _MyContentPageState createState() => _MyContentPageState();
}

// Row/Column: 继承自Flex
// Flex: CSS Flex布局, 直接使用的较少
// Axis.vertical: Column
// Axis.horizontal: Row

/**
 * Row特点:
 *  - 水平方向尽可能占据比较大的空间
 *    * 水平方向也是希望包裹内容, 那么设置mainAxisSize = min
 *  - 垂直方向包裹内容
 * MainAxisAlignment:
 *  - start: 主轴的开始位置挨个摆放元素(默认值)
 *  - end: 主轴的结束位置挨个摆放元素
 *  - center: 主轴的中心点对齐
 *  - spaceBetween: 左右两边的间距为0, 其它元素之间平分间距
 *  - spaceAround: 左右两边的间距是其它元素之间的间距的一半
 *  - spaceEvenly: 所有的间距平分空间
 * CrossAxisAlignment:
 *  - start: 交叉轴的起始位置对齐
 *  - end: 交叉轴的结束位置对齐
 *  - center: 中心点对齐(默认值)
 *  - baseline: 基线对齐(必须有文本的时候才起效果)
 *  - stretch: 先Row占据交叉轴尽可能大的空间, 将所有的子Widget交叉轴的高度, 拉伸到最大
 */

class _MyContentPageState extends State<MyContentPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
//      mainAxisAlignment: MainAxisAlignment.start,
//      mainAxisAlignment: MainAxisAlignment.end,
//      mainAxisAlignment: MainAxisAlignment.center,
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//      crossAxisAlignment: CrossAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
//      crossAxisAlignment: CrossAxisAlignment.center,
//      crossAxisAlignment: CrossAxisAlignment.stretch,
      textDirection: TextDirection.ltr,
      children: <Widget>[
        Container(width: 60, height: 40, color: Colors.red),
        Container(width: 30, height: 80, color: Colors.green),
        Container(width: 90, height: 120, color: Colors.blue),
        Container(width: 40, height: 80, color: Colors.orange),
      ],
    );
  }
}