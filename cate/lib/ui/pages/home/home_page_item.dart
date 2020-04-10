import 'package:cate/core/model/category_model.dart';
import 'package:cate/ui/pages/home/meal/meal_page.dart';
import 'package:flutter/material.dart';

class XLCategoryItem extends StatelessWidget {
  final Color color;
  final String title;
  final XLCategoryModel category;

  XLCategoryItem(this.color, this.title, {this.category});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(XLMealListPage.routerName, arguments: category);
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              color.withAlpha(125),
              color,
            ],
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.display1.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
