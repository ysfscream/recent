import 'package:flutter/material.dart';

class LikedList extends StatefulWidget {
  LikedList({Key key}) : super(key: key);

  @override
  _LikedList createState() => _LikedList();
}

class _LikedList extends State<LikedList> with TickerProviderStateMixin {


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2d3447),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 45.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
