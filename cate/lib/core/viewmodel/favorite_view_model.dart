import 'package:cate/core/model/meal_model.dart';
import 'package:flutter/material.dart';

class XLFavoriteViewModel extends ChangeNotifier {
  List<XLMealModel> _favoriteMeals = [];

  List<XLMealModel> get favoriteMeals => _favoriteMeals;

  void addMeal(XLMealModel meal) {
    _favoriteMeals.add(meal);
    notifyListeners();
  }

  void removeMeal(XLMealModel meal) {
    _favoriteMeals.remove(meal);
    notifyListeners();
  }

  bool isFavoriteMeal(XLMealModel meal) {
    return _favoriteMeals.contains(meal);
  }

  void handle(XLMealModel meal) {
    if (isFavoriteMeal(meal)) {
      removeMeal(meal);
    } else {
      addMeal(meal);
    }
  }


}