import 'package:flutter/material.dart';

class LikedDialog extends StatelessWidget {

  final String content;

  LikedDialog({ Key key, this.content }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
      contentPadding: const EdgeInsets.all(15.0),
      backgroundColor: Color(0xff2d3447),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.favorite, color: Colors.redAccent),
          ),
          Text('已添加到通知列表'),
        ],
      ),
    );
  }
}