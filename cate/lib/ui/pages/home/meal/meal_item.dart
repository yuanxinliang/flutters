import 'package:cate/core/model/meal_model.dart';
import 'package:cate/core/viewmodel/favorite_view_model.dart';
import 'package:cate/ui/pages/home/meal_detail/meal_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:cate/core/util/size_fit.dart';
import 'package:provider/provider.dart';

class XLMealItem extends StatelessWidget {
  final XLMealModel meal;
  XLMealItem({this.meal});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.only(left: 16.px, right: 16.px, top: 16.px, bottom: 8.px),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.px)),
        child: Container(
          child: Column(
            children: <Widget>[
              _buildTopContent(),
              _buildBottmContent(),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          XLMealDetailPage.routerName,
          arguments: meal,
        );
      },
    );
  }

  Widget _buildTopContent() {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12.px)),
          child: Image.network(meal.imageUrl, width: double.infinity, height: 250.px, fit: BoxFit.cover,),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: Container(
            width: 250.px,
            padding: EdgeInsets.only(left: 10.px),
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(8.px)
            ),
            child: Text(meal.title, style: TextStyle(fontSize: 24, color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _buildBottmContent() {
    return Container(
//      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.px)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _operateWidget(Icons.schedule, '${meal.duration}分钟'),
          _operateWidget(Icons.restaurant, '简单'),
          Consumer<XLFavoriteViewModel>(
            builder: (ctx, vm, child) {
              final iconData = vm.isFavoriteMeal(meal) ? Icons.favorite : Icons.favorite_border;
              final title = vm.isFavoriteMeal(meal) ? '已收藏' : '收藏';
              return GestureDetector(
                child: _operateWidget(iconData, title),
                onTap: () {
                  vm.handle(meal);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _operateWidget(IconData data, String title) {
    return Container(
//      color: Colors.red,
      padding: EdgeInsets.symmetric(vertical: 10.px),
      width: 100.px,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(data),
          SizedBox(width: 5.px),
          Text(title, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
