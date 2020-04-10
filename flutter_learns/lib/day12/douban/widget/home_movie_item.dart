import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learns/day11/1.star_rating.dart';
import 'package:flutter_learns/day11/2.dashed_line.dart';
import 'package:flutter_learns/day12/douban/model/movie_item_model.dart';

class MovieItem extends StatelessWidget {
  final int rank;
  final MovieItemModel movie;
  MovieItem({this.rank, this.movie});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildHeader(),
          SizedBox(height: 8),
          _buildContent(),
          SizedBox(height: 8),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Text('No.${rank}'),
    );
  }

  Widget _buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildLeftContent(),
        _buildRightContent(),
      ],
    );
  }

  Widget _buildLeftContent() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.network(movie.imgURL, width: 80, height: 120, fit: BoxFit.cover,),
    );
  }

  Widget _buildRightContent() {
    return Expanded(
      child: IntrinsicHeight(
        child: Row(
          children: <Widget>[
            _buildMovieInfoContent(),
            SizedBox(width: 8),
            _buildDashedLine(),
            SizedBox(width: 8),
            _buildWish(),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieInfoContent() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildMovieInfoTitle(),
            SizedBox(height: 5),
            _buildMovieInfoRating(),
            SizedBox(height: 5),
            _buildMovieInfoBrief(),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieInfoTitle() {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            child: Icon(Icons.play_circle_outline, color: Colors.redAccent, size: 25),
            alignment: PlaceholderAlignment.middle,
          ),
          ...movie.title.runes.map((rune) {
            return WidgetSpan(
              child: Text(String.fromCharCode(rune), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              alignment: PlaceholderAlignment.middle,
            );
          }),
          TextSpan(text: '(${movie.year})', style: TextStyle(color: Colors.grey))
        ],
      ),
    );
    
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            child: Icon(Icons.play_circle_outline, color: Colors.redAccent, size: 25),
            alignment: PlaceholderAlignment.middle,
          ),
          WidgetSpan(
            child: Text(movie.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            alignment: PlaceholderAlignment.middle,
          ),
          TextSpan(text: '(${movie.year})', style: TextStyle(color: Colors.grey))
        ],
      ),
    );
  }

  Widget _buildMovieInfoRating() {
    return FittedBox(
      child: Row(
        children: <Widget>[
          XLStarRating(rate: movie.rating, size: 20,),
          SizedBox(width: 5),
          Text('${movie.rating}')
        ],
      ),
    );
  }

  Widget _buildMovieInfoBrief() {
    var genres = movie.genres;
    var casts = movie.casts;
    var director = movie.director;
    
    var genresStr = genres.join(' ');
    var castsStr = casts.map((item)=>item.name).toList().join(' ');
    var directorStr = director.name;

    var display = genresStr + ' / ' + directorStr + ' / ' + castsStr;

    return Text(
      display,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 16),
    );
  }

  Widget _buildDashedLine() {
    return Container(
      child: XLDashedLine(
        axis: Axis.vertical,
        count: 8,
        dashedLineWidth: 1,
        dashedLineHeight: 5,
      ),
    );
  }

  Widget _buildWish() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.favorite_border, color: Colors.orangeAccent, size: 25,),
          SizedBox(height: 5),
          Text('喜欢', style: TextStyle(fontSize: 14, color: Colors.orangeAccent))
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(5)
      ),
      child: Text(movie.originalTitle),
    );
  }
}
