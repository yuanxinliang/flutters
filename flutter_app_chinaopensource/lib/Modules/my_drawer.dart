import 'package:flutter/material.dart';
import 'package:flutterappchinaopensource/Modules/my_drawer_first.dart';
import 'package:flutterappchinaopensource/Modules/my_drawer_fourth.dart';
import 'package:flutterappchinaopensource/Modules/my_drawer_second.dart';
import 'package:flutterappchinaopensource/Modules/my_drawer_third.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  var titles = ['发布动弹', '动弹小黑屋', '关于', '设置'];
  var icons = [Icons.input, Icons.backup, Icons.airplay, Icons.settings];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.separated(
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                height: 250,
                color: Colors.red,
                child: Image.asset(
                  'assets/images/cover_img.jpg',
                  fit: BoxFit.fill,
                ),
              );
            }
            index -= 1;
            return ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              title: Text(titles[index]),
              leading: Icon(icons[index]),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                print(index);
                _push(index);
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider(height: 1,);
          },
          itemCount: 5),
    );
  }

  void _push(int index) {
    var next;
    switch (index) {
      case 0:{
        next = MyDrawePageFirst();
      }
      break;
      case 1:{
        next = MyDrawePageSecond();
      }
      break;
      case 2:{
        next = MyDrawePageThird();
      }
      break;
      case 3:{
        next = MyDrawePageFourth();
      }
      break;

      default: {
        print('default');
      }
      break;
    }

    Navigator.of(context).push(MaterialPageRoute(builder: (_){
      return next;
    }));
  }
}
