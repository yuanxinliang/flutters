import 'package:flutter/material.dart';
import 'package:flutterappdouban/page/component/dashed_line_widget.dart';
import 'package:flutterappdouban/page/component/star_rating_widget.dart';

class MovieItemWidget extends StatefulWidget {

  final int sort;
  final String imgUrl;
  final String title;
  final String year;
  final double rating;
  final String brief;
  final String original_title;

  MovieItemWidget({
    this.sort,
    this.imgUrl,
    this.title,
    this.year,
    this.rating,
    this.brief,
    this.original_title,
  });

  @override
  _MovieItemWidgetState createState() => _MovieItemWidgetState();
}

class _MovieItemWidgetState extends State<MovieItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _header(),
          SizedBox(height: 8),
          _content(),
          SizedBox(height: 8),
          _footer(),
          SizedBox(height: 4),
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
      child: Text('No.${widget.sort}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget _content() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _contentImg(),
        SizedBox(width: 8),
        _contentInfo(),
      ],
    );
  }

  Widget _contentImg() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(widget.imgUrl, height: 150, width: 95, fit: BoxFit.cover,),
    );
  }
  
  Widget _contentInfo() {
    return Expanded(
      child: IntrinsicHeight(
        child: Row(
          children: <Widget>[
            Expanded(child: _contentBrief()),
            SizedBox(width: 8),
            _contentDashedLine(),
            SizedBox(width: 8),
            _contentWish(),
          ],
        ),
      ),
    );
  }

  Widget _contentBrief() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _contentBriefTitle(),
          SizedBox(height: 5),
          _contentBriefRating(),
          SizedBox(height: 5),
          _contentBriefPerson()
        ],
      ),
    );
  }

  Widget _contentBriefTitle() {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            child: Icon(
              Icons.play_circle_outline, color: Colors.red, size: 20,),
            alignment: PlaceholderAlignment.middle,
          ),
          TextSpan(text: ' '),
          TextSpan(text: widget.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          TextSpan(text: '(${widget.year})',
              style: TextStyle(fontSize: 14, color: Color(0xffaaaaaa))),
        ],
      ),
    );
  }

  Widget _contentBriefRating() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: XLStarRating(rate: widget.rating, size: 20),
    );
  }

  Widget _contentBriefPerson() {
    return Container(
      child: Text(
        widget.brief,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _contentDashedLine() {
    return Container(
      width: 1,
      child: XLDashedLine(
        axis: Axis.vertical,
        dashedLineWidth: 1,
        dashedLineHeight: 5,
        count: 10,
      ),
    );
  }

  Widget _contentWish() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.star_border, color: Colors.orangeAccent, size: 25,),
          Text('想看', style: TextStyle(fontSize: 12, color: Colors.orangeAccent),)
        ],
      ),
    );
  }

  Widget _footer() {
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      child: Text('${widget.original_title}'),
      decoration: BoxDecoration(
        color: Color(0xffeeeeee),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
