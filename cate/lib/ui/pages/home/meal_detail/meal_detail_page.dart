import 'package:cate/core/model/meal_model.dart';
import 'package:cate/core/viewmodel/favorite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:cate/core/util/size_fit.dart';
import 'package:provider/provider.dart';

class XLMealDetailPage extends StatelessWidget {
  static const String routerName = '/mealDetail';
  XLMealModel _meal;
  @override
  Widget build(BuildContext context) {
    _meal = ModalRoute.of(context).settings.arguments as XLMealModel;
    return Scaffold(
      appBar: AppBar(title: Text(_meal.title)),
      body: _buildContent(),
      floatingActionButton: Consumer<XLFavoriteViewModel>(
        builder: (ctx, vm, child) {
          final iconData = vm.isFavoriteMeal(_meal) ? Icons.favorite : Icons.favorite_border;
          final iconColor = vm.isFavoriteMeal(_meal) ? Colors.red : Colors.white;
          return FloatingActionButton(
            backgroundColor: Colors.amber,
            child: Icon(iconData, color: iconColor),
            onPressed: () {
              vm.handle(_meal);
            },
          );
        },
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 34),
      child: Column(
        children: <Widget>[
          _buildImg(),
          _buildMakeMaterial(),
          _bulidMaterialDetail(),
          _buildMakeStep(),
          _buildStpeDetail()
        ],
      ),
    );
  }

  Widget _buildImg() {
    return Image.network(_meal.imageUrl, width: double.infinity, scale: 1.5);
  }
  Widget _buildMakeMaterial() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.px),
      child: Text(
        '制作材料',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
  Widget _bulidMaterialDetail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.px),
      padding: EdgeInsets.all(8.px),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.grey),
        borderRadius: BorderRadius.circular(8.px),
        color: Colors.white,
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _meal.ingredients.length,
        itemBuilder: (ctx, index) {
          return Card(
            color: Colors.amber,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.px, horizontal: 8.px),
              child: Text(_meal.ingredients[index]),
            ),
          );
        },
      ),
    );
  }
  Widget _buildMakeStep() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.px),
      child: Text(
        '制作步骤',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
  Widget _buildStpeDetail() {

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.px),
      padding: EdgeInsets.all(8.px),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.grey),
        borderRadius: BorderRadius.circular(8.px),
        color: Colors.white,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: _meal.steps.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.px),
            child: ListTile(
              title: Text(_meal.steps[index]),
              leading: CircleAvatar(
                child: Text('#${index + 1}'),
              ),
            ),
          );
        },
        separatorBuilder: (ctx, index) {
          return Divider(
            height: 0.5,
            thickness: 0.5,
            color: Colors.black12,
            indent: 12.px,
            endIndent: 12.px,
          );
        },),
    );
  }
}