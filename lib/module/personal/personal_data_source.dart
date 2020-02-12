
import 'package:douban/common/network/network_helper.dart';
import 'package:douban/module/model/book_model.dart';
import 'package:douban/module/model/movie_model.dart';
import 'package:douban/module/model/music_model.dart';
import 'package:douban/module/model/watch_model.dart';

class PersonalDataSource {
  final void Function() onDataCallback;

  PersonalDataSource({
    this.onDataCallback
  });

  List<bool> hasRsp = [false, false, false];
  
  List movieWantedList = List();
  List movieWatchedList = List();

  List bookWantedList = List();
  List bookWatchedList = List();

  List musicWantedList = List();
  List musicWatchedList = List(); 

  void reset() {
    movieWantedList.clear();
    movieWatchedList.clear();

    bookWantedList.clear();
    bookWatchedList.clear();

    musicWantedList.clear();
    musicWatchedList.clear();   

    hasRsp = [false, false, false]; 
  }

  // 电影
  void requestMovieWantedList(List<WatchModel> list) {
    for (WatchModel watch in list) {
      String url = 'http://sas.qq.com/cgi-bin/db/data?t=%5B%22ke_coding_movie%22%5D&q=%7Bke_coding_movie(_page:1,_limit:1,id:%22${watch.id}%22)%7Bid,title,rating%7Bmax,average,stars,min,details%7Bscore_1,score_2,score_3,score_4,score_5%7D%7D,genres,casts%7Balt,avatars%7Bsmall,large,medium%7D,name,name_en,id%7D,durations,mainland_pubdate,pubdates,has_video,collect_count,original_title,subtype,directors%7Balt,avatars%7Bsmall,large,medium%7D,name,id%7D,year,images%7Bsmall,large,medium%7D,alt%7D%7D';
      NetworkHelper.shared.requestDouBanList(url, _onMovieWantedCallback);
    }
  }

  void requestMovieWatchList(List<WatchModel> list) {
    for (WatchModel watch in list) {
      String url = 'http://sas.qq.com/cgi-bin/db/data?t=%5B%22ke_coding_movie%22%5D&q=%7Bke_coding_movie(_page:1,_limit:1,id:%22${watch.id}%22)%7Bid,title,rating%7Bmax,average,stars,min,details%7Bscore_1,score_2,score_3,score_4,score_5%7D%7D,genres,casts%7Balt,avatars%7Bsmall,large,medium%7D,name,name_en,id%7D,durations,mainland_pubdate,pubdates,has_video,collect_count,original_title,subtype,directors%7Balt,avatars%7Bsmall,large,medium%7D,name,id%7D,year,images%7Bsmall,large,medium%7D,alt%7D%7D';
      NetworkHelper.shared.requestDouBanList(url, _onMovieWatchedCallback);
    }
  }  

  void _onMovieWantedCallback(int statusCode, dynamic resultMap) {
    if (statusCode == 200 && resultMap is Map) {    
      for (dynamic result in resultMap['result']) {
        movieWantedList.add(MovieModel.castFromMap(result));
      }
      onDataCallback();
    }
  }  

  void _onMovieWatchedCallback(int statusCode, dynamic resultMap) {
    if (statusCode == 200 && resultMap is Map) {    
      for (dynamic result in resultMap['result']) {
        movieWatchedList.add(MovieModel.castFromMap(result));
      }
      onDataCallback();
    }
  } 

  //图书
  void requestBookWantedList(List<WatchModel> list) {
    for (WatchModel watch in list) {
      String url = 'http://sas.qq.com/cgi-bin/db/data?t=%5B%22ke_coding_book%22%5D&q=%7Bke_coding_book(_page:1,_limit:1,id:%22${watch.id}%22)%7Bid,title,rating%7Bmax,numRaters,average,min%7D,subtitle,author,pubdate,tags%7Bcount,name,title%7D,origin_title,image,binding,translator,catalog,pages,images%7Bsmall,large,medium%7D,alt,publisher,isbn10,isbn13,url,alt_title,author_intro,summary,price,ebook_price,ebook_url,series%7Bid,title%7D%7D%7D';
      NetworkHelper.shared.requestDouBanList(url, _onBookWantedCallback);
    }
  }

  void requestBookWatchList(List<WatchModel> list) {
    for (WatchModel watch in list) {
      String url = 'http://sas.qq.com/cgi-bin/db/data?t=%5B%22ke_coding_book%22%5D&q=%7Bke_coding_book(_page:1,_limit:1,id:%22${watch.id}%22)%7Bid,title,rating%7Bmax,numRaters,average,min%7D,subtitle,author,pubdate,tags%7Bcount,name,title%7D,origin_title,image,binding,translator,catalog,pages,images%7Bsmall,large,medium%7D,alt,publisher,isbn10,isbn13,url,alt_title,author_intro,summary,price,ebook_price,ebook_url,series%7Bid,title%7D%7D%7D';
      NetworkHelper.shared.requestDouBanList(url, _onBookWatchedCallback);
    }
  }  

  void _onBookWantedCallback(int statusCode, dynamic resultMap) {
    if (statusCode == 200 && resultMap is Map) {    
      for (dynamic result in resultMap['result']) {
        bookWantedList.add(BookModel.castFromMap(result));
      }

      onDataCallback();
    }
  }  

  void _onBookWatchedCallback(int statusCode, dynamic resultMap) {
    if (statusCode == 200 && resultMap is Map) {    
      for (dynamic result in resultMap['result']) {
        bookWatchedList.add(BookModel.castFromMap(result));
      }

      onDataCallback();
    }
  }    

  //音乐
  void requestMusicWantedList(List<WatchModel> list) {
    for (WatchModel watch in list) {
      String url = 'http://sas.qq.com/cgi-bin/db/data?t=%5B%22ke_coding_music%22%5D&q=%7Bke_coding_music(_page:1,_limit:1,id:%22${watch.id}%22)%7Bid,title,alt,rating%7Bmax,average,numRaters,min%7D,author%7Bname%7D,alt_title,image,tags%7Bcount,name%7D,mobile_link,attrs%7Bpublisher,singer,version,pubdate,title,media,tracks,discs%7D%7D%7D';
      NetworkHelper.shared.requestDouBanList(url, _onMusicWantedCallback);
    }
  }

  void requestMusicWatchList(List<WatchModel> list) {
    for (WatchModel watch in list) {
      String url = 'http://sas.qq.com/cgi-bin/db/data?t=%5B%22ke_coding_music%22%5D&q=%7Bke_coding_music(_page:1,_limit:1,id:%22${watch.id}%22)%7Bid,title,alt,rating%7Bmax,average,numRaters,min%7D,author%7Bname%7D,alt_title,image,tags%7Bcount,name%7D,mobile_link,attrs%7Bpublisher,singer,version,pubdate,title,media,tracks,discs%7D%7D%7D';
      NetworkHelper.shared.requestDouBanList(url, _onMusicWatchedCallback);
    }
  }  

  void _onMusicWantedCallback(int statusCode, dynamic resultMap) {
    if (statusCode == 200 && resultMap is Map) {    
      for (dynamic result in resultMap['result']) {
        musicWantedList.add(MusicModel.castFromMap(result));
      }

      onDataCallback();
    }
  }  

  void _onMusicWatchedCallback(int statusCode, dynamic resultMap) {
    if (statusCode == 200 && resultMap is Map) {    
      for (dynamic result in resultMap['result']) {
        musicWatchedList.add(MusicModel.castFromMap(result));
      }

      onDataCallback();
    }
  }  
}