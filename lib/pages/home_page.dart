import 'package:flutter/material.dart';
import 'package:recent/pages/upcoming_movies.dart';

class HomePage extends StatelessWidget {
  // 应用程序的根组件
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
      // 隐藏右上角的 debug 横幅标志
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color darkThemeColor = Color(0xff2d3447);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkThemeColor,
      body: UpcomingMovies(),
    );
  }
}
