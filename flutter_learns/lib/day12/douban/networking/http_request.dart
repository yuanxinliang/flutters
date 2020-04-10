import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_learns/day12/douban/model/movie_item_model.dart';

class HttpRequest {
  static Future<List<MovieItemModel>> getMovieData() async {
    String url = 'https://api.douban.com/v2/movie/top250?start=0&count=25&apikey=0df993c66c0c636e29ecbb5344252a4a';
    Response res = await Dio().request(url);
    var subjects = res.data['subjects'];
    List<MovieItemModel> movieItems = [];
    for (var sub in subjects) {
      movieItems.add(MovieItemModel.fromJson(sub));
    }
    print(movieItems.length);
    return movieItems;
  }
}