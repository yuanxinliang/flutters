import 'package:flutter/material.dart';

class XLCategoryItem extends StatelessWidget {
  final Color color;
  final String title;

  XLCategoryItem(this.color, this.title);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(title);
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              color.withAlpha(125),
              color,
            ],
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme
                .of(context)
                .textTheme
                .display1
                .copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
