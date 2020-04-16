
import 'package:cate/core/model/meal_model.dart';
import 'package:cate/core/service/meal_request.dart';
import 'package:cate/core/viewmodel/filter_view_model.dart';
import 'package:flutter/cupertino.dart';

class XLMealViewModel extends ChangeNotifier {

  List<XLMealModel> _meals = [];
  XLFilterViewModel _filter;

  // 0、过了能够实现过滤，将XLFilterViewModel绑定到XLMealViewModel
  void updateFilterVM(XLFilterViewModel filter) {
    _filter = filter;
  }

  // 1、过滤，前提条件：需要获取到XLFilterViewModel
  List<XLMealModel> get meals {
    return _meals.where((element) {
      if (_filter.isGlutenFree && !element.isGlutenFree) return false;
      if (_filter.isLactoseFree && !element.isLactoseFree) return false;
      if (_filter.isVegetarian && !element.isVegetarian) return false;
      if (_filter.isVegan && !element.isVegan) return false;
      return true;
    }).toList();
  }

  XLMealViewModel() {
    XLMealRequest.getMealData().then((value){
      _meals = value;
      notifyListeners();
    });
  }

}