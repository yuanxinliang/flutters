import 'package:cate/core/model/category_model.dart';
import 'package:cate/core/model/meal_model.dart';
import 'package:cate/core/service/meal_request.dart';
import 'package:cate/core/viewmodel/meal_view_model.dart';
import 'package:cate/ui/pages/home/meal/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class XLMealListPage extends StatelessWidget {
  static const String routerName = '/mealList';
  @override
  Widget build(BuildContext context) {
    // ModalRoute.of(context).settings.arguments 进入和退出界面时，都会执行build方法，
    // 正常逻辑退出界面时不会或不应该再执行build方法的
    XLCategoryModel category = ModalRoute.of(context).settings.arguments as XLCategoryModel;
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: XLMealListContent(),
    );
  }
}

class XLMealListContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    XLCategoryModel category = ModalRoute.of(context).settings.arguments as XLCategoryModel;
    return Selector<XLMealViewModel, List<XLMealModel>>(
      selector: (ctx, mealVM) {
        return mealVM.meals.where((meal) {
          return meal.categories.contains(category.id);
        }).toList();
      },
      shouldRebuild: (prev, next) {
        return !ListEquality().equals(prev, next);
      },
      builder: (ctx, meals, child) {
        return ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) {
            return XLMealItem(meal: meals[index]);
          },
        );
      },
    );
  }
}

