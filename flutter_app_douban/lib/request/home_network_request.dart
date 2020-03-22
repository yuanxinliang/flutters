
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutterappdouban/model/movie_model.dart';
import 'package:flutterappdouban/network/network.dart';
import 'package:flutterappdouban/network/network_config.dart';

typedef SuccessCallBack = void Function(dynamic data);

class HomeRequest {

  //  https://douban.uieee.com/v2/movie/top250?start=0&count=20
  static getMovies(int start, int count, {SuccessCallBack success}) {
    print('获取电影数据');
    final url = movies_list_url;
    final param = {'start' : start, 'count' : count};
    Network.get(url, param: param)
    ..then((response) {
      print('返回数据');
      var json = response.data;
      print(json.runtimeType);
      var movies = _handleMoviesData(json);
      success(movies);
    })
    ..catchError((error){
      print('返回错误');
    });
  }

  static List<MovieModel> _handleMoviesData(Map<String, dynamic> data) {
    List movies = data['subjects'];
    List<MovieModel> movieItems = [];
    for (Map<String, dynamic> map in movies) {
      movieItems.add(MovieModel.fromMap(map));
    }
    return movieItems;
  }

}