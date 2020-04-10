import 'package:flutter/material.dart';
import 'package:flutter_learns/day12/douban/model/movie_item_model.dart';
import 'package:flutter_learns/day12/douban/widget/home_movie_item.dart';
import '../networking/http_request.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<MovieItemModel> models = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HttpRequest.getMovieData().then((value) {
      setState(() {
        models = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页'),),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return ListView.separated(
      itemBuilder: (ctx, index) {
        return MovieItem(rank: index + 1, movie: models[index]);
      },
      separatorBuilder: (ctx, index) {
        return Divider(color: Colors.black26, height: 15, thickness: 15, indent: 0, endIndent: 0,);
      },
      itemCount: models.length,
    );
  }
}

