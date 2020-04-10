import 'package:cate/core/viewmodel/favorite_view_model.dart';
import 'package:cate/ui/pages/home/meal/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class XLFavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('收藏')),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Consumer<XLFavoriteViewModel>(
      builder: (ctx, vm, child) {
        if (vm.favoriteMeals.length == 0) {
          return Center(child: Text('没有收藏记录！'));
        }
        return ListView.builder(
          itemCount: vm.favoriteMeals.length,
          itemBuilder: (ctx, index) {
            return XLMealItem(meal: vm.favoriteMeals[index]);
          },
        );
      },
    );
  }
}