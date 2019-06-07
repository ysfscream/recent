import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: Color(0xff2d3447),
      appBar: AppBar(
        title: Text('即将上映'),
        backgroundColor: Color(0xff58617A),
      ),
      body: SingleChildScrollView(
        child: SizedBox()
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
