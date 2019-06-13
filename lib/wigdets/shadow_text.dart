import 'package:flutter/material.dart';

class ShadowText extends StatelessWidget {
  ShadowText({
    Key key,
    @required this.text,
    this.size = 14,
    this.color,
  }) : assert(text != null), super(key: key);
  
  final String text;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
        fontSize: size,
        color: color,
        shadows: [
          Shadow(
            color: Colors.black87,
            offset: Offset(3.0, 3.0),
            blurRadius: 4.0,
          )
        ],
      ),
    );
  }
}