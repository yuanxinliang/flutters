import 'package:flutter/material.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  var titles = [
    '我的消息',
    '阅读记录',
    '我的博客',
    '我的问答',
    '我的活动',
    '我的团队',
    '邀请好友',
  ];

  var images = [
    Icons.message,
    Icons.chrome_reader_mode,
    Icons.block,
    Icons.question_answer,
    Icons.local_activity,
    Icons.group,
    Icons.input,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        itemBuilder: (c, i) {
          if (i == 0) {
            return Container(
              height: 200,
              color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/ic_avatar_default.png',
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(height: 10),
                  Text('点击头像登录', style: TextStyle(color: Colors.white),),
                ],
              ),
            );
          }
          i -= 1;
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Icon(images[i]),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Container(
                  child: Text(
                    titles[i],
                    style: TextStyle(fontSize: 16),
                  ),
                )),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          );
        },
        separatorBuilder: (c, i) {
          return Divider(height: 0.5);
        },
        itemCount: 8,
      ),
    );
  }
}
