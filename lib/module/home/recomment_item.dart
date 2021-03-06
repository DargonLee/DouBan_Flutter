import 'package:douban/module/category/categroy_page.dart';
import 'package:douban/module/model/book_model.dart';
import 'package:douban/module/model/douban_model.dart';
import 'package:douban/module/model/movie_model.dart';
import 'package:douban/module/model/music_model.dart';
import 'package:douban/module/widgets/display_item.dart';
import 'package:flutter/material.dart';

class RecommentItem extends StatelessWidget {
  final BuildContext context;
  final DoubanCategory category;
  final List<MovieModel> movies;
  final List<BookModel> books;
  final List<MusicModel> musics;

  RecommentItem({
    Key key,
    this.context,
    this.category,
    this.movies = const [],
    this.books = const [],
    this.musics = const [],
  });

  void _onMoreTapped() {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return CategoryPage(category: this.category,);
      }
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 240,
      padding: EdgeInsets.only(left: 10),
      child: Column(
        children: <Widget>[
          _titleItem(),
          Container(height: 10,),
          DisplayItem(
            context: context,
            category: category,     
            items: category == DoubanCategory.Movie ? this.movies : category == DoubanCategory.Book ? this.books : this.musics,
          )
        ],
      ),
    );
  }

  Widget _titleItem () {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          DoubanModel.getDoubanTitle(category),
          style: TextStyle(fontSize: 26, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: _onMoreTapped,
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              '更多',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey
              ),
            ),
          )
        ),
      ],
    );
  }
}