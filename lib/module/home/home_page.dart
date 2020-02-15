import 'package:douban/module/category/categroy_page.dart';
import 'package:douban/module/home/recomment_item.dart';
import 'package:douban/module/model/douban_model.dart';
import 'package:douban/module/nutrition/nutrition_page.dart';
import 'package:douban/module/public/app_util.dart';
import 'package:douban/module/search/search_page.dart';
import 'package:douban/module/widgets/jump_route.dart';
import 'package:douban/module/widgets/root_page.dart';
import 'package:douban/module/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'home_data_source.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  HomeDataSource _homeDataSource;

  @override
  void initState() {
    super.initState();
    initDataSource();
  }

  void initDataSource() {
    _homeDataSource = HomeDataSource(onDataCallback: _onDataCallback);
    _homeDataSource.requestHomeRecommandMovie();
    _homeDataSource.requestHomeRecommandBook();
    _homeDataSource.requestHomeRecommandMusic();
  }

  void _onDataCallback() {
    setState(() {});
  }

  void _onSearchBarTapped() {
    Navigator.push(context, JumpRoute(builder: (BuildContext context) {
      return SearchPage();
    }));
    //Navigator.pushNamed(context, '/search');
  }

  void _onMenuTapped() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return NutritionPage();
      }
    ));
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
      top: 102,
      child: Container(
        width: AppUtil.screenWidth,
        height: AppUtil.screenHeight - 102,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            RecommentItem(
              context: context,
              category: DoubanCategory.Movie,
              movies: _homeDataSource.movieList,
            ),
            RecommentItem(
              context: context,
              category: DoubanCategory.Book,
              books: _homeDataSource.bookList,
            ),
            RecommentItem(
              context: context,
              category: DoubanCategory.Music,
              musics: _homeDataSource.musicList,
            ),
          ],
        ),
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
        Container(
          width: 25,
          child: IconButton(icon: Icon(Icons.menu), onPressed: _onMenuTapped),
        ),
      ],
    );
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
}
