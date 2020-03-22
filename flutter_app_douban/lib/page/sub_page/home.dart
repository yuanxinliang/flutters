import 'package:flutter/material.dart';
import 'package:flutterappdouban/model/movie_model.dart';
import 'package:flutterappdouban/page/item/movie_item_widget.dart';
import 'package:flutterappdouban/request/home_network_request.dart';
import 'package:flutterappdouban/network/network.dart';

class XLHomePage extends StatefulWidget {
  @override
  _XLHomePageState createState() => _XLHomePageState();
}

class _XLHomePageState extends State<XLHomePage> {

  List<MovieModel> movies = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeRequest.getMovies(0, 30, success: (data){
      setState(() {
        movies = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (ctx, idx) {
          final sort = idx + 1;
          final movie = movies[idx];
          final title = movie.title;
//          final imgUrl;
          final original_title = movie.original_title;
          print(movie);
          return MovieItemWidget(
            sort: sort,
            imgUrl: movie.imgUrl,
            title: title,
            year: movie.year,
            rating: movie.rating,
            brief: movie.brief,
            original_title: original_title,
          );
        },
        separatorBuilder: (ctx, idx) {
          return Container(color: Color(0xffdddddd), height: 10);
        },
        itemCount: movies.length,
    );
  }
}
