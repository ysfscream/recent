import 'package:flutter/material.dart';
import 'package:recent/models/data.dart';
import 'package:recent/wigdets/shadow_text.dart';

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
    // final Size size = MediaQuery.of(context).size;

    // final double _itemHeight = (size.height - kToolbarHeight + 20) / 2;
    // final double _itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: Color(0xff2d3447),
      appBar: AppBar(
        title: Text('即将上映'),
        backgroundColor: Color(0xff58617A),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SafeArea(
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10.0,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final itemID = data[index]['id'];
                  return GridListItem(
                    tag: itemID,
                    name: data[index]['name'],
                    want: data[index]['want'],
                    image: Image.asset(
                      data[index]['url'],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            )
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

class GridListItem extends StatelessWidget {
  GridListItem({
    Key key,
    @required this.tag,
    @required this.name,
    @required this.want,
    @required this.image,
  }) : assert(image != null), super(key: key);

  final Image image;
  final String tag;
  final String name;
  final String want;

  @override
  Widget build(BuildContext context) {
    final Widget item = GestureDetector(
      onTap: () {
        print(tag);
      },
      child: Hero(
        tag: tag,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black26,
                offset: Offset(3.0, 6.0),
                blurRadius: 5.0,
              ),
            ],
          ),
          child: image,
        ),
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(6.0),
      child: GridTile(
        footer: GestureDetector(
          child: GridTileBar(
            backgroundColor:Colors.black54,
            title: FittedBox(
              // 缩小资源以确保整个资源都在容器内
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: ShadowText(
                  text: name,
                  size: 16.0,
                ),
              )
            ),
            subtitle: ShadowText(
              text: '$want 人想看',
              size: 12.0,
            ),
            // 在 title 前面的是 leading，后面的 trailing
            trailing: Icon(
              Icons.star_border,
              color: Colors.yellow,
            ),
          ),
        ),
        child: item,
      ),
    );
  }
}
