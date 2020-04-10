
import 'package:cate/core/model/meal_model.dart';
import 'package:cate/core/service/http_request.dart';
import 'package:dio/dio.dart';

class XLMealRequest {

  static Future<List<XLMealModel>> getMealData() async {
    final url = '/meal';
    var data = await HttpRequest.request(url);
    var meals = data['meal'];
    List<XLMealModel> mealArr = [];
    for (var meal in meals) {
      mealArr.add(XLMealModel.fromJson(meal));
    }
    print('meal总数：${mealArr.length}');
    return mealArr;
  }

}