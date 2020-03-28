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
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 1
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    // 2
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    // 3
    _sizeAnimation = Tween(begin: 50.0, end: 150.0).animate(_controller);
    // 4
    _controller.addListener(() {
      setState(() {
      });
    });
    // 5
    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }
  
  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('一直build组件，性能不好'); // 由于第四步引起，可优化
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: Center(
        child: Icon(
          Icons.favorite,
          color: Colors.orangeAccent,
          size: _sizeAnimation.value,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          print('click');
          if (_controller.isAnimating) {
            _controller.stop();
          } else if (_controller.status == AnimationStatus.forward) {
            _controller.forward();
          } else if (_controller.status == AnimationStatus.reverse) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
      ),
    );
  }
}