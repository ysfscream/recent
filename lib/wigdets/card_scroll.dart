import 'package:flutter/material.dart';
import 'dart:math';

double _cardAspectRatio = 12.0 / 16.0;
double _widgetAspectRatio = _cardAspectRatio * 1.2;

class CardScroll extends StatelessWidget {

  final double currentPage;
  final List<Map<String, String>> cardData;

  CardScroll({
    Key key,
    @required this.cardData,
    @required this.currentPage}) : super(key: key);

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
          
          for (int i = 0; i < cardData.length; i++) {
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
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(3.0, 6.0),
                              blurRadius: 8.0,
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage(cardData[i]['url']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                                  child: Text(
                                    cardData[i]['name'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32.0,
                                      fontWeight: FontWeight.w400,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black87,
                                          offset: Offset(3.0, 3.0),
                                          blurRadius: 4.0,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                                  margin: const EdgeInsets.only(bottom: 30.0, left: 30.0),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20.0)
                                  ),
                                  child: Text(
                                    '5月31日',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 135,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                          margin: const EdgeInsets.only(bottom: 30.0, left: 30.0),
                          child: Text(
                            '10800 人想看',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  offset: Offset(3.0, 3.0),
                                  blurRadius: 3.0,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
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
