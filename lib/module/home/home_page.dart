import 'package:douban/module/category/categroy_page.dart';
import 'package:douban/module/model/douban_model.dart';
import 'package:douban/module/search/search_page.dart';
import 'package:douban/module/widgets/root_page.dart';
import 'package:douban/module/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {

  void _onSearchBarTapped() {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return CategoryPage(category: DoubanCategory.Movie);
      }
    ));
    //Navigator.pushNamed(context, '/search');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RootPage(
      body: Stack(
        children: <Widget>[Container(), _topWidget(), _bottomWidget()],
      ),
    );
  }

  Widget _topWidget() {
    return Container(
        height: 170,
        color: Color(0xFF33c9FF),
        child: SafeArea(
          child: Container(
            height: 52,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
              top: 20,
              right: 20,
              left: 15,
            ),
            child: _searchbarWidget(),
      ),
    ),
  );
}

  Widget _bottomWidget() {
    return Positioned(
      top: 150,
      child: Container(
        width: 300,
        height: 500,
      ),
    );
  }

  Widget _searchbarWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _onSearchBarTapped,
          child: SearchBar(isEnable: false),
        ),
        Image(
          width: 16,
          height: 16,
          image: AssetImage('lib/images/scan.png'),
        )
      ],
    );
  }
}
