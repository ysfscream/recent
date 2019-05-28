import 'package:flutter/material.dart';
import 'package:recent/models/data.dart';
import 'package:recent/wigdets/card_scroll.dart';

class UpcomingMovies extends StatefulWidget {
  UpcomingMovies({Key key}) : super(key: key);

  @override
  _UpcomingMoviesState createState() => _UpcomingMoviesState();
}

class _UpcomingMoviesState extends State<UpcomingMovies> {
  // ComingModel _comingModel;
  PageController _pageController;
  Color darkThemeBgColor = Color(0xff2d3447);
  Color darkThemeTextColor = Colors.white;

  double _currentPage = images.length - 1.0;
  int _total = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: images.length - 1);
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page;
      });
    });
    // _loadData();
  }

  // Future<void> _loadData() async {
  //   Api api = Api();
  //   Map res = await api.httpGet(
  //     url: '/coming_soon',
  //   );
  //   _comingModel = ComingModel.fromJSON(res);
  //   print(_comingModel.title);
  //   setState(() {
  //     _total = _comingModel.total;
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 45.0, bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: darkThemeTextColor,
                  size: 30.0,
                ),
                onPressed: () => {},
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: darkThemeTextColor,
                  size: 30.0,
                ),
                onPressed: () => {},
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '即将上映',
                style: TextStyle(
                  fontSize: 35.0,
                  color: darkThemeTextColor,
                  letterSpacing: 1.0,
                ),
              ),
              // IconButton(
              //   icon: Icon(
              //     Icons.more_horiz,
              //   ),
              //   color: darkThemeTextColor,
              //   onPressed: () => {},
              // )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 10.0),
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFff6e6e),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 6.0),
                    child: Text(
                      '全部电影',
                      style: TextStyle(
                        color: darkThemeTextColor,
                      ),
                    ),
                  )
                ),
              ),
              FlatButton(
                child: Text(
                  _total == 0 ? '...' : '${_total.toString()}+ 部电影',
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
                onPressed: () => {},
              ),
            ],
          ),
        ),
        Stack(
          children: <Widget>[
            CardScroll(
              currentPage: _currentPage,
              cardImages: images,
            ),
            Positioned.fill(
              child: PageView.builder(
                itemCount: images.length,
                controller: _pageController,
                reverse: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onDoubleTap: () {
                      print(images[index]);
                    },
                  );
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
