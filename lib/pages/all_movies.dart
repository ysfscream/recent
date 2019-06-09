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
    var size = MediaQuery.of(context).size;

    final double _itemHeight = (size.height - kToolbarHeight + 10) / 2;
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
                return Column(
                  children: <Widget>[
                    Container(
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
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        data[index]['name'],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
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
