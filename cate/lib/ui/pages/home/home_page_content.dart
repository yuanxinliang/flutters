import 'dart:math';

import 'package:cate/core/model/category_model.dart';
import 'package:cate/core/model/json_parse.dart';
import 'package:cate/ui/pages/home/home_page_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cate/core/util/size_fit.dart';

class XLHomeContent extends StatefulWidget {
  @override
  _XLHomeContentState createState() => _XLHomeContentState();
}

class _XLHomeContentState extends State<XLHomeContent> {

  List<XLCategoryModel> _categories = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    XLJsonParse.getCategoryData().then((data){
      setState(() {
        _categories = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverSafeArea(
          sliver: SliverPadding(
            padding: EdgeInsets.all(20.px),
            sliver: _buildGridView(),
          ),
        ),
      ],
    );
  }

  Widget _buildGridView() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20.px,
        crossAxisSpacing: 20.px,
        childAspectRatio: 1.5,
      ),
      delegate: SliverChildBuilderDelegate((BuildContext context,
          int index) {
        var category = _categories[index];
        return XLCategoryItem(category.cColor, category.title, category: category);
      },
        childCount: _categories.length,
      ),
    );
  }
}
