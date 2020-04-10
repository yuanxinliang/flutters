import 'package:cate/core/viewmodel/filter_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cate/core/util/size_fit.dart';
import 'package:provider/provider.dart';

class XLFilterPage extends StatelessWidget {
  static const routerName = '/filter';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('美食过滤'),),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return CustomScrollView(
      slivers: <Widget>[
        // 如果不是Sliver家族的Widget，需要使用SliverToBoxAdapter做层包裹
        _buildHeader(),
        _buildSelections(),
      ],
    );
  }

  Widget _buildHeader() {
    return SliverToBoxAdapter(
      child: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(top: 16.px, bottom: 8.px),
          child: Text(
            '展示你的选择',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildSelections() {
    return Consumer<XLFilterViewModel>(
      builder: (ctx, vm, chilid) {
        return SliverList(
          delegate: SliverChildListDelegate(
            [
              ListTile(title: Text('无谷蛋白'), trailing: CupertinoSwitch(value: vm.isGlutenFree, onChanged: (value) {
                vm.isGlutenFree = value;
              },),),
              ListTile(title: Text('不含乳糖'), trailing: CupertinoSwitch(value: vm.isLactoseFree, onChanged: (value) {
                vm.isLactoseFree = value;
              },),),
              ListTile(title: Text('素食主义'), trailing: CupertinoSwitch(value: vm.isVegetarian, onChanged: (value) {
                vm.isVegetarian = value;
              },),),
              ListTile(title: Text('严格素食主义'), trailing: CupertinoSwitch(value: vm.isVegan, onChanged:  (value) {
                vm.isVegan = value;
              },),),
            ],
          ),
        );
      },
    );
  }
}
