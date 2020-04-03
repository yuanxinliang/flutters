import 'dart:convert';

import 'package:cate/core/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class XLJsonParse {

  static Future<List<XLCategoryModel>> getCategoryData() async {
    final jsonString = await rootBundle.loadString('assets/json/category.json');
    final jsonMap = json.decode(jsonString);
    final categories = jsonMap['category'];
    List<XLCategoryModel> models = [];
    for (var category in categories) {
      models.add(XLCategoryModel.fromJson(category));
    }
    return models;
  }
}