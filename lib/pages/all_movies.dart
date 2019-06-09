import 'package:flutter/material.dart';
import 'package:recent/models/data.dart';

class AllMovies extends StatefulWidget {
  AllMovies({Key key}) : super(key: key);

  @override
  _AllMovies createState() => _AllMovies();
}

class _AllMovies extends State<AllMovies> with TickerProviderStateMixin {
  bool _sortBytime = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final double _itemHeight = (size.height - kToolbarHeight + 20) / 2;
    final double _itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: Color(0xff2d3447),
      appBar: AppBar(
        title: Text('即将上映'),
        backgroundColor: Color(0xff58617A),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 20.0,
                crossAxisCount: 2,
                childAspectRatio: (_itemWidth / _itemHeight),
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6.0),
                            topRight: Radius.circular(6.0)
                          ),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(6.0, 6.0),
                              blurRadius: 5.0,
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage(data[index]['url']),
                            fit: BoxFit.fill
                          )
                        ),
                      ),
                      Container(
                        height: 100,
                        width: _itemWidth,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(6.0),
                            bottomRight: Radius.circular(6.0)
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                data[index]['name'],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text(
                              data[index]['want'] + ' 人想看',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1.0, color: Colors.lightBlue),
                                    ),
                                    child: Text(
                                      '5月31日',
                                      style: TextStyle(
                                        color: Colors.lightBlue,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.favorite_border,
                                    size: 20.0,
                                    color: Colors.redAccent,
                                  ),
                                ],
                              )
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFff6e6e),
        child: Icon(_sortBytime ? Icons.access_time: Icons.format_list_numbered),
        onPressed: () {
          setState(() {
            this._sortBytime = !this._sortBytime;
          });
        },
      ),
    );
  }
}
