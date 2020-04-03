import 'package:flutter/material.dart';

class XLCategoryModel {
  String id;
  String title;
  String color;
  Color cColor;

  XLCategoryModel({this.id, this.title, this.color});

  XLCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];
    int colorInt16 = int.parse(color, radix: 16);
    cColor = Color(colorInt16 | 0xFF000000);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['color'] = this.color;
    return data;
  }
}