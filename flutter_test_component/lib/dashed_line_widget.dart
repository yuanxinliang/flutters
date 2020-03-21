import 'package:flutter/material.dart';

class XLDashedLine extends StatefulWidget {
  final Axis axis;
  final double dashedLineWidth;
  final double dashedLineHeight;
  final int count;
  final Color dashedLineColor;

  XLDashedLine({
    this.axis = Axis.horizontal,
    this.dashedLineWidth = 1,
    this.dashedLineHeight = 1,
    this.count,
    this.dashedLineColor = Colors.red
  });

  @override
  _XLDashedLineState createState() => _XLDashedLineState();
}

class _XLDashedLineState extends State<XLDashedLine> {
  @override
  Widget build(BuildContext context) {

    int count_ = widget.count;
    print(count_);
    return Flex(
      direction: widget.axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(count_, (_) {
        return SizedBox(
          width: widget.dashedLineWidth,
          height: widget.dashedLineHeight,
          child: DecoratedBox(
            decoration: BoxDecoration(color: widget.dashedLineColor),
          ),
        );
      }),
    );

  }
}
