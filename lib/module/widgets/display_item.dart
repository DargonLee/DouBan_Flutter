import 'package:douban/module/model/book_model.dart';
import 'package:douban/module/model/movie_model.dart';
import 'package:douban/module/model/music_model.dart';
import 'package:flutter/material.dart';
import 'package:douban/module/public/app_util.dart';
import 'package:douban/module/widgets/rank_container.dart';
import 'package:douban/module/model/douban_model.dart';
import 'package:douban/module/detail/movie_detail_page.dart';

class DisplayItem extends StatelessWidget {

  final BuildContext context;
  final DoubanCategory category;
  final List items;

  DisplayItem({
    Key key,
    this.context,
    this.category,
    this.items
  }): super(key: key);

  void _onItemTapped(int index) {
    //Navigator.pushNamed(context, 'category_detail');

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      if (category == DoubanCategory.Movie) {
        return MovieDetailPage(movie: items[index]);
      } 
      // else if (category == DoubanCategory.Book) {
      //   return BookDetailPage(book: items[index],);
      // } else {
      //   return MusicDetailPage(music: items[index],);
      // }
    }));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: _buildItem, 
        separatorBuilder: (BuildContext context ,index) {
          return Container(
            width: (AppUtil.screenWidth - 4 * 80 - 20)/3,
          );
        },
        itemCount: 4
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: <Widget>[
          FadeInImage.assetNetwork(
            width: 80,
            height: 112,
            placeholder: 'lib/images/scan.png', //_getImageUrl(index)
            image: 'http://a0.att.hudong.com/78/52/01200000123847134434529793168.jpg'
          ),
          Container(height: 10,),
          RankContainer(
            width: 80,
            height: 34,
            rank: 4,//_getItemScore(index)
            score: 7.6,//_getItemRank(index)
          )
        ],
      ),
    );
  }

  String _getImageUrl(int index) {
    if (items.length <= index) return '';

    if (category == DoubanCategory.Movie && items[index] is MovieModel) {
      MovieModel movie = items[index];
      return movie.image;
    } else if (category == DoubanCategory.Book && items[index] is BookModel) {
      BookModel book = items[index];
      return book.image;
    } else {
      MusicModel music = items[index];
      return music.image;
    }
  }

  String _getItemTitle(int index) {
    if (items.length <= index) return '';

    if (category == DoubanCategory.Movie && items[index] is MovieModel) {
      MovieModel movie = items[index];
      return movie.title;
    } else if (category == DoubanCategory.Book && items[index] is BookModel) {
      BookModel book = items[index];
      return book.title;
    } else {
      MusicModel music = items[index];
      return music.title;
    }
  }  

  double _getItemScore(int index) {
    if (items.length <= index) return 0.0;

    if (category == DoubanCategory.Movie && items[index] is MovieModel) {
      MovieModel movie = items[index];
      return movie.rating;
    } else if (category == DoubanCategory.Book && items[index] is BookModel) {
      BookModel book = items[index];
      return book.rating;
    } else {
      MusicModel music = items[index];
      return music.rating;
    }
  }    

  int _getItemRank(int index) {
    if (items.length <= index) return 0;

    if (category == DoubanCategory.Movie && items[index] is MovieModel) {
      MovieModel movie = items[index];
      return movie.rank;
    } else if (category == DoubanCategory.Book && items[index] is BookModel) {
      BookModel book = items[index];
      return book.rank;
    } else {
      MusicModel music = items[index];
      return music.rank;
    }
  }  
}