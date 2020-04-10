import 'package:cate/ui/pages/filter/filter_page.dart';
import 'package:flutter/material.dart';
import 'package:cate/core/util/size_fit.dart';
class XLMainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.px,
      child: Drawer(
        child: Container(
          child: Column(
            children: <Widget>[
              _buildHeader(),
              _buildOperateList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.amber,
      width: double.infinity,
      height: 120.px,
      alignment: Alignment(0, 0.7),
      child: Text('开始动手', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
    );
  }

  Widget _buildOperateList(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 16.px),
      children: <Widget>[
        GestureDetector(
          child: ListTile(
            title: Text('进餐', style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.restaurant),
          ),
          onTapUp: (_) {
            Scaffold.of(context).openEndDrawer();
          },
        ),
        GestureDetector(
          child: ListTile(
            title: Text('过滤', style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.settings),
          ),
          onTapUp: (_) {
            Navigator.of(context).pushNamed(XLFilterPage.routerName);
          },
        ),
      ],
    );
  }
}
