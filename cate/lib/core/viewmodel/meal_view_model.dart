
import 'package:cate/core/model/meal_model.dart';
import 'package:cate/core/service/meal_request.dart';
import 'package:flutter/cupertino.dart';

class XLMealViewModel extends ChangeNotifier {

  List<XLMealModel> _meals = [];

  List<XLMealModel> get meals => _meals;

  XLMealViewModel() {
    XLMealRequest.getMealData().then((value){
      _meals = value;
      notifyListeners();
    });
  }

}