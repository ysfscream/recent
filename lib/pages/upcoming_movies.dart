import 'package:flutter/material.dart';
import 'package:recent/models/data.dart';
import 'package:recent/wigdets/card_scroll.dart';
// import 'package:recent/utils/api.dart';
// import 'package:recent/models/comingModel.dart';
import 'package:recent/wigdets/liked_dialog.dart';
import 'package:recent/pages/liked_list.dart';
import 'package:recent/pages/all_movies.dart';

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

  double _currentPage = data.length - 1.0;
  int _total = 68;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: data.length - 1);
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
  //   print(_comingModel.subjects);
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
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () {
                  Navigator.push(context, PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500),
                    pageBuilder: (BuildContext context, Animation<double> animation,
                      Animation secondaryAnimation ) {
                        return FadeTransition(
                          opacity: animation,
                          child: LikedList(),
                        );
                    },
                  ));
                },
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
                  fontSize: 32.0,
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
                  // _total == 0 ? '...' : '${_total.toString()}+ 部电影',
                  '${_total.toString()}+ 部电影',
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return AllMovies();
                      }
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Stack(
          children: <Widget>[
            CardScroll(
              currentPage: _currentPage,
              cardData: data,
            ),
            Positioned.fill(
              child: PageView.builder(
                itemCount: data.length,
                controller: _pageController,
                reverse: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onDoubleTap: () {
                      print(data[index]);
                      showDialog(
                        context: context,
                        builder: (context) => LikedDialog(),
                      );
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
