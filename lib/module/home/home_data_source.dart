
import 'package:douban/common/network/network_helper.dart';
import 'package:douban/module/model/book_model.dart';
import 'package:douban/module/model/movie_model.dart';
import 'package:douban/module/model/music_model.dart';
import 'package:douban/module/public/app_util.dart';


class HomeDataSource {
  final void Function() onDataCallback;

  HomeDataSource({
    this.onDataCallback
  });

  List<MovieModel> movieList = List();
  List<BookModel> bookList = List();
  List<MusicModel> musicList = List();

  // 电影
  void requestHomeRecommandMovie() {            
    int month = AppUtil.getCurrentMonth();
    String url = 'http://sas.qq.com/cgi-bin/db/data?t=%5B%22ke_coding_movie%22%5D&q=%7Bke_coding_movie(_page:1,_limit:4,id:%22%25$month%25%22)%7Bid,title,rating%7Bmax,average,stars,min,details%7Bscore_1,score_2,score_3,score_4,score_5%7D%7D,genres,casts%7Balt,avatars%7Bsmall,large,medium%7D,name,name_en,id%7D,durations,mainland_pubdate,pubdates,has_video,collect_count,original_title,subtype,directors%7Balt,avatars%7Bsmall,large,medium%7D,name,id%7D,year,images%7Bsmall,large,medium%7D,alt%7D%7D';
    NetworkHelper.shared.requestDouBanList(url, _onMovieCallback);
  }

  void _onMovieCallback(int statusCode, dynamic resultMap) {
    if (statusCode == 200 && resultMap is Map) {    
      for (dynamic result in resultMap['result']) {
        movieList.add(MovieModel.castFromMap(result));
      }
      onDataCallback();
    }
  }

  //图书
  void requestHomeRecommandBook() {            
    int month = AppUtil.getCurrentMonth();
    String url = 'http://sas.qq.com/cgi-bin/db/data?t=%5B%22ke_coding_book%22%5D&q=%7Bke_coding_book(_page:1,_limit:4,pubdate:%22%25$month%25%22)%7Bid,title,rating%7Bmax,numRaters,average,min%7D,subtitle,author,pubdate,tags%7Bcount,name,title%7D,origin_title,image,binding,translator,catalog,pages,images%7Bsmall,large,medium%7D,alt,publisher,isbn10,isbn13,url,alt_title,author_intro,summary,price,ebook_price,ebook_url,series%7Bid,title%7D%7D%7D';
    NetworkHelper.shared.requestDouBanList(url, _onBookCallback);
  }

  void _onBookCallback(int statusCode, dynamic resultMap) {
    if (statusCode == 200 && resultMap is Map) {    
      for (dynamic result in resultMap['result']) {
        bookList.add(BookModel.castFromMap(result));
      }
      onDataCallback();      
    }    
  }

  //音乐
  void requestHomeRecommandMusic() {
    int month = AppUtil.getCurrentMonth();
    String url = 'http://sas.qq.com/cgi-bin/db/data?t=%5B%22ke_coding_music%22%5D&q=%7Bke_coding_music(_page:1,_limit:4,id:%22%25${month}%25%22)%7Bid,title,alt,rating%7Bmax,average,numRaters,min%7D,author%7Bname%7D,alt_title,image,tags%7Bcount,name%7D,mobile_link,attrs%7Bpublisher,singer,version,pubdate,title,media,tracks,discs%7D%7D%7D';
    NetworkHelper.shared.requestDouBanList(url, _onMusicCallback);
  }

  void _onMusicCallback(int statusCode, dynamic resultMap) {
    if (statusCode == 200 && resultMap is Map) {    
      for (dynamic result in resultMap['result']) {
        musicList.add(MusicModel.castFromMap(result));
      }

      onDataCallback();      
    }    
  }

}