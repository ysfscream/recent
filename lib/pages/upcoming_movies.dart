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

    return Scaffold(
      backgroundColor: darkThemeBgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
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
                  IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                    ),
                    color: darkThemeTextColor,
                    onPressed: () => {},
                  )
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
                      return Container();
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// double cardAspectRatio = 12.0 / 16.0;
// double widgetAspectRatio = cardAspectRatio * 1.2;

// class CardScroll extends StatelessWidget {
//   final double currentPage;
//   final double padding = 20.0;
//   final double verticalInset = 20.0;

//   CardScroll(this.currentPage);

//   @override
//   Widget build(BuildContext context) {
//     return new AspectRatio(
//       aspectRatio: widgetAspectRatio,
//       child: LayoutBuilder(builder: (context, contraints) {
//         final double width = contraints.maxWidth;
//         final double height = contraints.maxHeight;

//         final double safeWidth = width - 2 * padding;
//         final double safeHeight = height - 2 * padding;

//         final double heightOfPrimaryCard = safeHeight;
//         final double widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

//         final double primaryCardLeft = safeWidth - widthOfPrimaryCard;
//         final double horizontalInset = primaryCardLeft / 2;

//         List<Widget> cardList = new List();

//         for (int i = 0; i < images.length; i++) {
//           double delta = i - currentPage;
//           bool isOnRight = delta > 0;

//           double start = padding +
//               max(
//                   primaryCardLeft -
//                       horizontalInset * -delta * (isOnRight ? 15 : 1),
//                   0.0);

//           var cardItem = Positioned.directional(
//             top: padding + verticalInset * max(-delta, 0.0),
//             bottom: padding + verticalInset * max(-delta, 0.0),
//             start: start,
//             textDirection: TextDirection.rtl,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(16.0),
//               child: Container(
//                 decoration: BoxDecoration(color: Colors.white, boxShadow: [
//                   BoxShadow(
//                       color: Colors.black12,
//                       offset: Offset(3.0, 6.0),
//                       blurRadius: 10.0)
//                 ]),
//                 child: AspectRatio(
//                   aspectRatio: cardAspectRatio,
//                   child: Stack(
//                     fit: StackFit.expand,
//                     children: <Widget>[
//                       Image.asset(images[i], fit: BoxFit.cover),
//                       Align(
//                         alignment: Alignment.bottomLeft,
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 16.0, vertical: 8.0),
//                               child: Text(title[i],
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 25.0,
//                                       fontFamily: "SF-Pro-Text-Regular")),
//                             ),
//                             SizedBox(
//                               height: 10.0,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 12.0, bottom: 12.0),
//                               child: Container(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 22.0, vertical: 6.0),
//                                 decoration: BoxDecoration(
//                                     color: Colors.blueAccent,
//                                     borderRadius: BorderRadius.circular(20.0)),
//                                 child: Text("Read Later",
//                                     style: TextStyle(color: Colors.white)),
//                               ),
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//           cardList.add(cardItem);
//         }
//         return Stack(
//           children: cardList,
//         );
//       }),
//     );
//   }
// }