import 'package:flutter/material.dart';
import 'dart:math';

double _cardAspectRatio = 12.0 / 16.0;
double _widgetAspectRatio = _cardAspectRatio * 1.2;

class CardScroll extends StatelessWidget {

  final double currentPage;
  final List<String> cardImages;

  CardScroll({Key key, @required this.cardImages, @required this.currentPage}) : super(key: key);
  final double _padding = 20.0;
  final double _verticalInset = 20.0;

  final List<Positioned> _cardItems = [];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _widgetAspectRatio,
      child: LayoutBuilder(
        builder: (context, contraints) {
          double _maxWidth = contraints.maxWidth;
          double _maxHeight = contraints.maxHeight;

          double _safeWidth = _maxWidth - 2 * _padding;
          double _safeHeight = _maxHeight - 2 * _padding;

          double _heightOfPrimaryCard = _safeHeight;
          double _widthOfPrimaryCard = _heightOfPrimaryCard * _cardAspectRatio;

          double _primaryCardLeft = _safeWidth - _widthOfPrimaryCard;
          double _horizontalInset = _primaryCardLeft / 2;
          
          for (int i = 0; i < cardImages.length; i++) {
            double detal = i - currentPage;
            bool isOnRight = detal > 0;

            double start = _padding + max(
                _primaryCardLeft - _horizontalInset * -detal * (isOnRight ? 15.0 : 1.0), 
                0.0);
            Positioned cardItem = Positioned.directional(
              textDirection: TextDirection.rtl,
              top: _padding + _verticalInset * max(-detal, 0.0),
              bottom: _padding + _verticalInset * max(-detal, 0.0),
              start: start,
              child: AspectRatio(
                aspectRatio: _cardAspectRatio,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.asset(cardImages[i], fit: BoxFit.cover),
                  ],
                ),
              ),
            );
            _cardItems.add(cardItem);
          }
          return Stack(
            children: _cardItems,
          );
        },
      ),
    );
  }
}
