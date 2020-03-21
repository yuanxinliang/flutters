import 'package:flutter/material.dart';

class XLStarRating extends StatefulWidget {
  final double rate;
  final double maxRate;
  final double size;
  final int count;
  final Color selectColor;
  final Color unselectColor;
  final Widget selectImg;
  final Widget unselectImg;

  XLStarRating({
    @required this.rate,
    this.maxRate = 10,
    this.size = 40,
    this.count = 5,
    this.selectColor = Colors.red,
    this.unselectColor = Colors.grey,
    Widget selectImg,
    Widget unselectImg,
  }) : this.selectImg = selectImg ?? Icon(Icons.star, color: selectColor, size: size),
       this.unselectImg = unselectImg ?? Icon(Icons.star_border, color: unselectColor, size: size);

  @override
  _XLStarRatingState createState() => _XLStarRatingState();
}

class _XLStarRatingState extends State<XLStarRating> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Stack(
        children: <Widget>[
          _unselectStars(),
          _selectStars(),
        ],
      ),
    );
  }

  Widget _unselectStars() {
    List<Widget> stars = [];
    stars = List.generate(widget.count, (_) {
      return widget.unselectImg;
    });
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: stars,
    );
  }

  Widget _selectStars() {

    List<Widget> stars = [];

    double length = (widget.rate/widget.maxRate) * widget.count ;
    int wholes = length.floor();

    for(int i = 0; i < wholes; i++) {
      stars.add(widget.selectImg);
    }

    double part = length - wholes;
    if (part > 0) {
      var partStar = ClipRect(
        child: widget.selectImg,
        clipper: XLClipper(width: part * widget.size),
      );
      stars.add(partStar);
    }

    if (stars.length > widget.count) {
      stars = stars.sublist(0, widget.count);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: stars,
    );
  }
}

class XLClipper extends CustomClipper<Rect> {

  final double width;

  XLClipper({this.width});

  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    return Rect.fromLTWH(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(XLClipper oldClipper) {
    // TODO: implement shouldReclip
    return width != oldClipper.width;
  }
}


