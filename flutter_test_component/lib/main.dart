import 'package:flutter/material.dart';
import 'dashed_line_widget.dart';
import 'star_rating_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('主页'),),
        body: Container(
          color: Colors.white,
          child: Center(child: _content())
        ),
      ),
    );
  }

  Widget _content() {
//    return XLStarRating(rate: 9.0);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 300,
          child: XLDashedLine(
            axis: Axis.horizontal,
            dashedLineWidth: 10,
            count: 10,
          ),
        ),
        Container(
          height: 300,
          child: XLDashedLine(
            axis: Axis.vertical,
            dashedLineHeight: 10,
            count: 10,
          ),
        ),
      ],
    );
  }

}
