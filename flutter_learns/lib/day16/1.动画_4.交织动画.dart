import 'dart:math';

import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyContentPage(),
    );
  }
}

class MyContentPage extends StatefulWidget {
  @override
  _MyContentPageState createState() => _MyContentPageState();
}

class _MyContentPageState extends State<MyContentPage>
    with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation _animation;
  Animation _sizeAnimation;
  Animation _alphaAnimation;
  Animation _rotationAnimation;
  Animation _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1)
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    _sizeAnimation = Tween(begin: 200.0, end: 0.0).animate(_controller);
    _alphaAnimation = Tween(begin: 1.0, end: 0.0).animate(_controller);
    _rotationAnimation = Tween(begin: 0.0, end: 2.0 * pi).animate(_controller);
    _colorAnimation = ColorTween(begin: Colors.red, end: Colors.orangeAccent).animate(_controller);

    _controller.addStatusListener((status){
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (ctx, child) {
            return Opacity(
              opacity: _alphaAnimation.value,
              child: Transform(
                transform: Matrix4.rotationZ(_rotationAnimation.value),
                alignment: Alignment.center,
                child: Container(
                  color: _colorAnimation.value,
                  width: _sizeAnimation.value,
                  height: _sizeAnimation.value,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}