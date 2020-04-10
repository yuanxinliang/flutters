import 'package:cate/core/router/router.dart';
import 'package:cate/core/util/size_fit.dart';
import 'package:cate/core/util/theme.dart';
import 'package:cate/core/viewmodel/filter_view_model.dart';
import 'package:cate/core/viewmodel/meal_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/viewmodel/favorite_view_model.dart';

//void main() => runApp(MyApp());
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => XLMealViewModel()),
        ChangeNotifierProvider(create: (ctx) => XLFavoriteViewModel()),
        ChangeNotifierProvider(create: (ctx) => XLFilterViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    XLSizeFit.initial();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '美食广场',
      theme: XLTheme.normalTheme,
      // 根视图
      initialRoute: XLRouter.initialRouter,
      // 路由视图
      routes: XLRouter.routers,
      onGenerateRoute: XLRouter.generateRouter,
    );
  }
}