import 'package:flutter/material.dart';
import 'package:recent/models/data.dart';
// import 'package:recent/utils/api.dart';
// import 'package:recent/models/comingModel.dart';

class HotMovies extends StatefulWidget {
  HotMovies({Key key}) : super(key: key);

  @override
  _HotMovies createState() => _HotMovies();
}

class _HotMovies extends State<HotMovies> {

  @override
  void initState() {
    super.initState();
    // _loadData();
  }

  // Future<void> _loadData() async {
  //   Api api = Api();
  //   Map res = await api.httpGet(
  //     url: '/coming_soon',
  //   );
  // }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '正在热映',
                style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.white,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 375.0,
          child: ListView.builder(
            padding: const EdgeInsets.all(20.0),
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              List _genres = data[index]['genres'];

              return Padding(
                padding: EdgeInsets.only(right: index == data.length - 1 ? 0.0 : 20.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: 180,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(6.0, 6.0),
                            blurRadius: 5.0,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(data[index]['url']),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      width: 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            data[index]['name'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: Colors.yellowAccent,
                                  size: 14.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  data[index]['rating'].toString(),
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            )
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              _genres.join(' | '),
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                  ],
                )
              );
            },
          )
        ),
      ],
    );
  }
}
